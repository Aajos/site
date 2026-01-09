create table public.sessions(
    id uuid primary key default gen_random_uuid(),
    title text not null,
    starts_at timestamptz not null,

    ends_at timestamptz not null,
    created_at timestamptz default now(),

);

