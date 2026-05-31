class NotesController < ApplicationController

  before_action :set_client

  def create
    @note = @client.notes.create(note_params)
    if @note.save
      redirect_to @client, notice: "Note created."
    else
      redirect_to @client, alert: "Failed to create note."
    end
  end

  def destroy
    @note = @client.notes.find(params[:id])
    if @note.destroy
      redirect_to @client, notice: "Note deleted."
    else
      redirect_to @client, alert: "Failed to delete note."
    end
  end


  private
  def set_client
    @client = current_user.clients.find(params[:client_id])
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
