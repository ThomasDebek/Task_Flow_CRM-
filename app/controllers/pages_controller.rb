class PagesController < ApplicationController
  def home
    @clients_count = Client.count
    @leads_count = Lead.count
    @tasks_count = Task.count

    @tasks_pending = Task.pending.count
    @tasks_in_progress = Task.in_progress.count
    @tasks_overdue = Task.overdue.count
    @tasks_done = Task.done.count


    @recent_leads = Lead.order(created_at: :desc).limit(5)
    @recent_tasks = Task.includes(:client).order(created_at: :desc).limit(5)
  end
end
