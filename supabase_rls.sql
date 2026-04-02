-- Row Level Security policies for Wallet Flow
-- Run in Supabase SQL editor (or as a migration).
--
-- Assumes both tables have a `user_id` column of type uuid that matches auth.users.id
-- and are located in the `public` schema.

-- -----------------------
-- wallets
-- -----------------------

alter table public.wallets enable row level security;
alter table public.wallets force row level security;

drop policy if exists "wallets_select_own" on public.wallets;
create policy "wallets_select_own"
on public.wallets
for select
using (auth.uid() = user_id);

drop policy if exists "wallets_insert_own" on public.wallets;
create policy "wallets_insert_own"
on public.wallets
for insert
with check (auth.uid() = user_id);

drop policy if exists "wallets_update_own" on public.wallets;
create policy "wallets_update_own"
on public.wallets
for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "wallets_delete_own" on public.wallets;
create policy "wallets_delete_own"
on public.wallets
for delete
using (auth.uid() = user_id);

-- -----------------------
-- Expenses
-- -----------------------

alter table public."Expenses" enable row level security;
alter table public."Expenses" force row level security;

drop policy if exists "expenses_select_own" on public."Expenses";
create policy "expenses_select_own"
on public."Expenses"
for select
using (auth.uid() = user_id);

drop policy if exists "expenses_insert_own" on public."Expenses";
create policy "expenses_insert_own"
on public."Expenses"
for insert
with check (auth.uid() = user_id);

drop policy if exists "expenses_update_own" on public."Expenses";
create policy "expenses_update_own"
on public."Expenses"
for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "expenses_delete_own" on public."Expenses";
create policy "expenses_delete_own"
on public."Expenses"
for delete
using (auth.uid() = user_id);