class BlessingsController < ApplicationController
	def quiz
		@blessings = Blessing.all.shuffle
	end

	def new
		@blessing = Blessing.new
	end

	def create
		@blessing = Blessing.new(permit_params)
		if @blessing.save
			redirect_to done_blessing_path(@blessing)
		else
			render 'new'
		end
	end

	def done
		@blessing = Blessing.find(params[:id])
	end

	def update
		@blessing = Blessing.find(params[:id])
		if @blessing.update(permit_params)
			redirect_to done_blessing_path(@blessing)
		else
			render 'add_question'
		end
	end

	def solve
		@blessing = Blessing.find(params[:id])
		if params[:id] == params[:answer_id]
			@blessing.update(solved: true)
		end
	end

	def get_question
		@blessing = Blessing.find(params[:id])
		@random_blessings = Blessing.where
																.not(id: params[:id])
																.order("RANDOM()")
																.take(3)
		@random_blessings << @blessing
		@random_blessings.shuffle!
	end

	def get_content
		@blessing = Blessing.find(params[:id])
	end

	# def show
	# 	@blessing = Blessing.find(params[:id])
	# 	redirect_to unsolved_blessing_path(@blessing) unless @blessing.solved?
	# end

	def permit_params
		params.require(:blessing).permit(:photo, :nickname, :content, :question)
	end
end
