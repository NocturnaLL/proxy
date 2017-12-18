class BaseApi

	require 'open-uri'
	#https://opentdb.com/api.php?amount=10&category=11&difficulty=easy&type=multiple
	#location/2459115/

	def initialize()
		#@city = open('https://www.metaweather.com/api/location/search/?query=new')
		raise NotImplementedError
  end

  def getBody(url)
		begin
    @obj = open(url)
		response_body = @obj.read
		writeFile(response_body)
    response_body
		rescue
			puts "Connection Error"
		end
  end

  def getStatus()
    response_status = @obj.status
    response_status
  end

  def writeFile(text)
    Logger.instance.log(text)
  end



end
