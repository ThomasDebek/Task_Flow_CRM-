require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "associations" do
    it { should belong_to(:client) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:status) }
    it "allows only valid statuses" do
      task = build(:task, status: "invalid")
      expect(task).not_to be_valid
      expect(task.errors[:status]).to include("is not included in the list")
    end
  end


  describe ".pending" do
    it "returns only pending tasks" do
      pending_task = create(:task, status: "pending")
      done_task = create(:task, status: "done")

      expect(Task.pending).to include(pending_task)
      expect(Task.pending).not_to include(done_task)
    end
  end

  describe ".in_progress" do
    it "returns only in progress tasks" do
      in_progress_task = create(:task, status: "in_progress")
      create(:task, status: "done")

      expect(Task.in_progress).to include(in_progress_task)
    end
  end

  describe ".done" do
    it "returns only done tasks" do
      done_task = create(:task, status: "done")
      create(:task, status: "pending")

      expect(Task.done).to include(done_task)
    end
  end

  describe ".overdue" do
    it "returns overdue tasks" do
      overdue_task = create(
        :task,
        due_date: Date.yesterday
      )

      create(
        :task,
        due_date: Date.tomorrow
      )

      expect(Task.overdue).to include(overdue_task)
    end
  end

end
