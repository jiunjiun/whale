class Consoles::SharksController < ConsoleController
  expose :sharks, -> { current_user.sharks.order(created_at: :desc).paginate(page: params[:page], per_page: 30) }
  expose :shark, find: -> (id){ sharks.find_by(id: id) }, build: ->(shark_params, scope){ sharks.build(shark_params) }

  before_action :validate_shark

  def index
  end

  def show
  end

  def new
  end

  def create
    if shark.save
      redirect_to consoles_shark_path(shark), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if shark.update shark_params
      redirect_to consoles_shark_path(shark), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    redirect_to consoles_sharks_path if shark.destroy
  end

  private
  def shark_params
    params.require(:shark)
          .permit(:name, :cetacea, :desc, :status, :website, :facebook_url, :github_url, :youtube_url, :logo, :banner)
  end

  def validate_shark
    redirect_to root_path and return unless shark
  end
end
