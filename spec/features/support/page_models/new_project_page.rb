require 'features/support/page_models/application_page'

module PageModels
  class NewProject < ApplicationPage
    set_url "/projects/new"

    class ProjectForm < SitePrism::Section
        element :name_field, "#project_name"
        element :create_button, "input[type='submit']"

        def fill_and_submit(project)
            name_field.set project.name
            create_button.click
        end
    end

    section :project_form, ProjectForm, "#new_project"
  end
end