class BlessingsController < ApplicationController
	def index
	end

	def new
		@blessing = Blessing.new
	end

	def create
		@blessing = Blessing.new(permit_params)
		@blessing.save!
		redirect_to add_question_blessing_path(@blessing)
	end

	def index
		@blessings = Blessing.solved
	end

	def add_question
		@blessing = Blessing.find(params[:id])
	end

	def update
		@blessing = Blessing.find(params[:id])
		@blessing.update!(permit_params)
		redirect_to @blessing
	end

	def unsolved
		@blessing = Blessing.find(params[:id])
		if !@blessing.solved?
			@random_blessings = Blessing.where
																	.not(id: params[:id])
																	.order("RANDOM()")
																	.take(3)
			@random_blessings << @blessing
		else
			redirect_to @blessing
		end
	end

	def start_solve
		@blessing = Blessing.unsolved.first
		if @blessing
			redirect_to @blessing
		else
			redirect_to blessings_path
		end
	end

	def solve
		@blessing = Blessing.find(params[:id])
		if params[:id] == params[:answer_id]
			@blessing.update(solved: true)
			# @correct = true # for front end ajax reaction
			redirect_to @blessing
		else
			# @correct = false
			redirect_to @blessing
		end
	end

	def show
		@blessing = Blessing.find(params[:id])
		redirect_to unsolved_blessing_path(@blessing) unless @blessing.solved?
	end

	def permit_params
		params.require(:blessing).permit(:photo, :nickname, :content, :question)
	end
end
