module Api
    class NoteController < ApplicationController
        def index
            notes = Note.order('created_at DESC');
            render json: notes, status: :ok
        end

        def show
            note = Note.find(params[:id])
            render json: note, status: :ok
        end

        def create
            note = Note.new(note_params)

            if note.save
                render json: note, status: :ok
            else
                render json: {status: 'ERROR', message:'Note not saved', data:note.errors},status: :unprocessable_entity
            end
        end

        def destroy
            note = Note.find(params[:id])
            note.destroy
            render json: note, status: :ok
        end

        def update
            note = Note.find(params[:id])
            if note.update_attributes(note_params)
                render json: note, status: :ok
            else
                render json: {status: 'ERROR', message:'Note not updated', data:note.errors},status: :unprocessable_entity
            end
        end

        private

        def note_params
            params.permit(:value, :customer_id)
        end
    end
end