class BloodTestsController < ApplicationController
  before_action :set_blood_test, only: [:show, :edit, :update, :destroy]

  # GET /blood_tests
  # GET /blood_tests.json
  def index
    @blood_tests = BloodTest.all
    @chart = BloodTest.index_chart
  end

  # GET /blood_tests/1
  # GET /blood_tests/1.json
  def show
  end

  # GET /blood_tests/new
  def new
    @blood_test = BloodTest.new
  end

  # GET /blood_tests/1/edit
  def edit
  end

  # POST /blood_tests
  # POST /blood_tests.json
  def create
    @blood_test = BloodTest.new(blood_test_params)

    respond_to do |format|
      if @blood_test.save
        format.html { redirect_to blood_tests_path, notice: 'Blood test was successfully created.' }
        format.json { render :show, status: :created, location: @blood_test }
      else
        format.html { render :new }
        format.json { render json: @blood_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blood_tests/1
  # PATCH/PUT /blood_tests/1.json
  def update
    respond_to do |format|
      if @blood_test.update(blood_test_params)
        format.html { redirect_to @blood_test, notice: 'Blood test was successfully updated.' }
        format.json { render :show, status: :ok, location: @blood_test }
      else
        format.html { render :edit }
        format.json { render json: @blood_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blood_tests/1
  # DELETE /blood_tests/1.json
  def destroy
    @blood_test.destroy
    respond_to do |format|
      format.html { redirect_to blood_tests_url, notice: 'Blood test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blood_test
      @blood_test = BloodTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blood_test_params
      params.require(:blood_test).permit(:bgl, :mass, :comment, :created_at)
    end
end
