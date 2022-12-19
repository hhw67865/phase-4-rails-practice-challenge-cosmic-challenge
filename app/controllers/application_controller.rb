class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_error
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

    private
    def record_invalid_error(failed)
        render json: {errors: failed.record.errors.full_messages}, status: :unprocessable_entity
    end
    def not_found_error(exception)
        render json: {error: exception}, status: :not_found
    end
end
