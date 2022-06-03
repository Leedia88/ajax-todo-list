class EmailsController < ApplicationController

    def index
        @emails = Email.all.order(:id).reverse
    end

    def create
        @email = Email.new(
            object: Faker::Games::Witcher.quote,
            body: Faker::Lorem.sentence(word_count: 20)
        )
        if @email.save
            respond_to do |format|
                format.html {redirect_to root_path}
                format.js {}
            end
        end
    end

    def show
        @email = Email.find(params[:id])
        respond_to do |format|
            format.html {
                redirect_to root_path}
            format.js {}
        end
    end

    def edit
        @email = Email.find(params[:id])
    end

    def update
        @email = Email.find(params[:id])
        @email.update_attribute(:read, params[:read])
        respond_to do |format|
            format.html {
                redirect_to root_path}
            format.js {
            }
        end
    end

    def destroy
        @email = Email.find(params[:id])
        @email.destroy
        respond_to do |format|
          format.html {redirect_to root_path}
          format.js {}
        end
    end

end
