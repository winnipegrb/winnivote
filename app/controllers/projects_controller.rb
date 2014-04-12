class ProjectsController < ApplicationController

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(params["project"])
        if @project.save
            redirect_to :root, notice: "Project successfully created"
        else
            render "new"
        end
    end

end