class PostsController < ApplicationController
  before_filter :authorize_blogger!, :except => [:index, :show]

    # GET /posts
    # GET /posts.json
    def index
      @posts = Post.all
        .paginate(:page => params[:page], :per_page => 5)
        .order('created_at DESC')
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = Post.find(params[:id])
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
      @post = Post.find(params[:id])
    end

    # POST /posts
    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /posts/1
    def update
      @post = Post.find(params[:id])
      
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render action: 'edit'
      end

    end

    # DELETE /posts/1
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_url

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :image, :body)
      end
  end
