class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /company
  # GET /company.json
  def index
    @companies = Company.includes(:employees)
  end

  # GET /company/1
  # GET /company/1.json
  def show
    @company = Company.includes(:employees).find(params[:id])
  end

  # GET /company/new
  def new
    @company = Company.new
    @address = @company.build_address
  end

  # GET /company/1/edit
  def edit
  end

  # POST /company
  # POST /company.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company/1
  # PATCH/PUT /company/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company/1
  # DELETE /company/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(
        :name,
        :address_id,
        :user_id,
        :email,
        {address_attributes: [:street, :city, :zip_code, :country, :id] })
    end
end
