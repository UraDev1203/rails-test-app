class FeedbacksController < ApplicationController
    def index
        @feedbacks = Feedback.all
        @feedback = Feedback.new
    end

    def new
        @product = Product.find(params[:product_id])
        @feedback = Feedback.new
    end

    def create
        @feedback = Feedback.new(feedback_params)

        respond_to do |format|
            if @feedback.save
                format.html { redirect_to products_path, notice: "Feedback submitted!" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private

    def feedback_params
        params.require(:feedback).permit(:product_id, :rating)
    end
end
