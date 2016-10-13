class ClicksController < ApplicationController
	def new
		@click = Click.new
	end

	def create
		@click = Click.new(click_params)
		uri = URI.parse(@click.short_url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		request = Net::HTTP::Get.new(uri.request_uri)
		request.initialize_http_header({"User-Agent" => "Mozilla/5.0 (Macintosh\; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36"})

		(@click.click_count).times do
			http.request(request)
		end

		redirect_to root_path, notice: "Done clicking #{@click.click_count} times on #{@click.short_url}!"
	end

	private
		def click_params
			params.require(:click).permit(:short_url, :click_count)
		end
end
