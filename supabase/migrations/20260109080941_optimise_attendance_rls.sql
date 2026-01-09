-- enable RLS
alter table public.sessions enable row level security;
alter table public.attendance enable row level security;

-- policies
create policy "Anyone can read sessions"
on public.sessions
for select
using (true);

create policy "Users can insert own attendance"
on public.attendance
for insert
with check ((select auth.uid()) = user_id);

create policy "Users can view own attendance"
on public.attendance
for select
using ((select auth.uid()) = user_id);