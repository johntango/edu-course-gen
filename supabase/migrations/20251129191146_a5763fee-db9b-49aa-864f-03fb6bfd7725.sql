-- Drop the overly permissive policy on agent_runs
DROP POLICY IF EXISTS "Allow public access to agent runs" ON public.agent_runs;

-- Create restrictive policies for agent_runs table
-- Only admins can view agent runs
CREATE POLICY "Admins can view agent runs"
ON public.agent_runs
FOR SELECT
TO authenticated
USING (is_admin());

-- Only admins can insert agent runs
CREATE POLICY "Admins can insert agent runs"
ON public.agent_runs
FOR INSERT
TO authenticated
WITH CHECK (is_admin());

-- Only admins can update agent runs
CREATE POLICY "Admins can update agent runs"
ON public.agent_runs
FOR UPDATE
TO authenticated
USING (is_admin())
WITH CHECK (is_admin());

-- Only admins can delete agent runs
CREATE POLICY "Admins can delete agent runs"
ON public.agent_runs
FOR DELETE
TO authenticated
USING (is_admin());