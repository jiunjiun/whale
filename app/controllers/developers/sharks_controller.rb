class Developers::SharksController < DeveloperController
  expose :sharks, -> { current_user.sharks.order(created_at: :desc).paginate(page: params[:page], per_page: 30) }
  expose :shark,  find: -> (id){ current_user.sharks.find_by(id: id) }, build: ->(shark_params, scope){ current_user.sharks.build(shark_params) }

  def index
  end

  def show
  end

  def new
  end

  def create
    if shark.save!
      redirect_to developers_shark_path(shark), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if shark.update shark_params
      redirect_to developers_shark_path(shark), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    redirect_to developers_sharks_path if shark.destroy
  end

  private
  def shark_params
    params.require(:shark)
          .permit(:name, :cetacea, :desc, :status, :web_url, :fb_url, :gh_url, :logo, :banner)
  end
end
