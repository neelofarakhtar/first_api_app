require 'swagger_helper'

describe 'Posts API' do

  path '/api/v1/posts' do

    post 'Creates a post' do
      tags 'Posts'
      consumes 'application/json', 'application/xml'
      parameter title: :params, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string }
        },
        required: [ 'title', 'content' ]
      }


      response '201', 'post created' do
        # debugger
        let(:params) { { title: 'Dodo', content: 'available' } }
        run_test!
        end

      response '422', 'invalid request' do
        let(:params) { { title: 'foo' } }
        run_test!
        end
     end
  end


   path '/api/v1/posts/{id}' do

    get 'Retrieves a post' do
      tags 'Posts'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            title: { type: :string },
            content: { type: :text }
          },
          required: [ 'id', 'title', 'content' ]

        let(:id) { Post.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'post not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end