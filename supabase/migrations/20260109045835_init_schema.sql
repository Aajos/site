create table public.sessions(
    id uuid primary key default gen_random_uuid(),
    title text not null,
    starts_at timestamptz not null,

    ends_at timestamptz not null,
    created_at timestamptz default now(),

);

create table public.attendance (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null references auth.users(id) on delete cascade,
    created_at timestamptz default now(),
    unique (user_id, session_id)

);