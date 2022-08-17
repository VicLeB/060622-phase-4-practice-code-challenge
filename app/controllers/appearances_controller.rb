class AppearancesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create
        appearance = Appearance.create!(appearance_params)
        render json: appearance, status: :created
    end

    private

    def appearance_params
        params.permit(:rating, :episode_id, :guest_id)
    end

    def render_unprocessable_entity(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end
end
