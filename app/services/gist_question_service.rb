class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)

    responce = ClientResponce.new(@client.last_response.status, @client.last_response.data.id,
                                  @client.last_response.data.html_url)
  end

  ClientResponce = Struct.new(:status, :id, :html_url) do
    def success?
      status == 201
    end
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.discription', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
