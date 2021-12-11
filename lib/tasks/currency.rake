namespace :currency do
  task update: :environment do
    uri = URI("http://data.fixer.io/api/latest")
    params = { access_key: ENV['FIXERIO_ACCESS_KEY'] }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    body = JSON.parse(res.body)

    progress_bar = ProgressBar.create(title: "Currencies updating from fixer.io", starting_at: 0, total: body["rates"].count)

    if res.is_a?(Net::HTTPSuccess)
      body["rates"].each do |iso_code, rate|
        current_currency = Currency.where(iso_code: iso_code.to_s).first_or_initialize
        current_currency.rate = rate.to_d
        current_currency.is_base = true if body["base"].eql?(iso_code.to_s)
        current_currency.save

        progress_bar&.increment
      end
    end
  end
end
