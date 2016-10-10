class ClicksController < ApplicationController
	def new
		@click = Click.new
	end

	def create
		@click = Click.new(click_params)
		@uri = URI(@click.short_url)
		(@click.click_count).times do
			Net::HTTP.get(@uri)
		end

		redirect_to root_path, notice: "Done clicking #{@click.click_count} times on #{@click.short_url}!"
	end

	private
		def click_params
			params.require(:click).permit(:short_url, :click_count)
		end
end
