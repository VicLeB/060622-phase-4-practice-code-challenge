class EpisodesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        episodes = Episode.all
        render json: episodes, status: :ok
    end

    def show
        episode = Episode.find(params[:id])
        render json: episode, serializer: EpisodeWithGuestsSerializer
    end

    def destroy
        episode = Episode.find(params[:id])
        episode.destroy
        head :no_content
    end

    private

    def record_not_found
        render json: {error: "Episode not found"}, status: :not_found
    end
end
