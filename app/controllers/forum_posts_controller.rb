class ForumPostsController < ApplicationController
    def create
        @thread = ForumThread.find(params[:forum_thread_id])
        @post = ForumPost.new(resource_params)
        @post.user = User.first
        @post.forum_thread = @thread

        if @post.save
            redirect_to forum_thread_path(@thread)
        else
            render 'forum_threads/show'
        end
    end

    private

    def resource_params
        params.require(:forum_post).permit(:content)
    end
    
end
