class ListtasksController < ApplicationController
  # GET /listtasks
  # GET /listtasks.json
  def index
    @listtasks = Listtask.order('name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listtasks }
    end
  end

  # GET /listtasks/1
  # GET /listtasks/1.json
  def show
    @listtask = Listtask.find(params[:id])
    if params[:status]
      @tasks = @listtask.tasks.where('state = ?', (params[:status]=='true')). order('priority')
    else
      @tasks = @listtask.tasks.order('priority')
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listtask }
    end
  end

  # GET /listtasks/new
  # GET /listtasks/new.json
  def new
    @listtask = Listtask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listtask }
    end
  end

  # GET /listtasks/1/edit
  def edit
    @listtask = Listtask.find(params[:id])
  end

  # POST /listtasks
  # POST /listtasks.json
  def create
    @listtask = Listtask.new(params[:listtask])

    respond_to do |format|
      if @listtask.save
        format.html { redirect_to @listtask, notice: 'Listtask was successfully created.' }
        format.json { render json: @listtask, status: :created, location: @listtask }
      else
        format.html { render action: "new" }
        format.json { render json: @listtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /listtasks/1
  # PUT /listtasks/1.json
  def update
    @listtask = Listtask.find(params[:id])

    respond_to do |format|
      if @listtask.update_attributes(params[:listtask])
        format.html { redirect_to listtasks_path, notice: 'Listtask was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @listtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listtasks/1
  # DELETE /listtasks/1.json
  def destroy
    @listtask = Listtask.find(params[:id])
    @listtask.destroy

    respond_to do |format|
      format.html { redirect_to listtasks_url }
      format.json { head :ok }
    end
  end

end
