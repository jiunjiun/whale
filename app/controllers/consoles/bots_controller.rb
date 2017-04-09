class Consoles::BotsController < ConsoleController
  expose :shark, find: -> (shark_id) { current_user.sharks.find_by(id: shark_id) }
  expose :bots, -> { shark.bots }
  expose :bot, find: -> (id) { bots.find_by(id: id) }, build: ->(bot_params, scope){ bots.build(bot_params) }

  def new
  end

  def create
    if bot.save
      redirect_to consoles_shark_path(shark), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if bot.update bot_params
      redirect_to consoles_shark_path(shark), notice: t('helpers.successfully_created')
    else
      render :edit
    end
  end

  def destroy
    redirect_to consoles_shark_path(shark) if bot.destroy
  end

  private
  def bot_params
    params.require(:bot).permit(:kind, :bot_id)
  end
end
