class Consoles::PhotosController < ConsoleController
  expose :shark, find: -> (shark_id) { current_user.sharks.find_by(id: shark_id) }
  expose :photos, -> { shark.photos.order(:position) }
  expose :photo, find: -> (id) { photos.find_by(id: id) }, build: ->(photo_params, scope){ photos.build(photo_params) }, model: SharkPhoto

  def index
    render json: photos.as_json
  end

  def create
    if photo.save!
      result = {status: :success, photo: {id: photo.id}}
    else
      result = {status: :fail}
    end

    render json: result
  end

  def update
    photo_params = params[:shark_photo]
    if photos.update photo_params.keys, photo_params.values
      result = {status: :success}
    else
      result = {status: :fail}
    end

    render json: result
  end

  def destroy
    if photo.destroy
      result = {status: :success}
    else
      result = {status: :fail}
    end

    render json: result
  end

  private
  def photo_params
    params.require(:shark_photo).permit(:image, :position)
  end
end
