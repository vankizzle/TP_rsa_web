class RsAsController < ApplicationController
  before_action :set_rsa, only: [:show, :edit, :update, :destroy]

  # GET /rsas
  # GET /rsas.json
  def index
    @rsas = Rsas.all
  end

  # GET /rsas/1
  # GET /rsas/1.json
  def show
	rsa = Rsas.find_by id: params[:id]
	render json {'n' => rsa.n,'e' => rsa.e,'d'=> rsa.d}
  end

  # GET /rsas/new
  def new
    @rsas = Rsas.new
  end

  # GET /rsas/1/edit
  def edit
  end

  # POST /rsas
  # POST /rsas.json
  def create
    if(params.has_key?(:n) && params.has_key?(:e) && params.has_key?(:d))
			rsa@ = Rsas.new(n: params[:n],e: params[:e],d: params[:d])
		else
			key = Array.new
			num = 1000
			q = rand(num)
			p = rand(num)
			while(1) do 
				q = rand(num)
				p = rand(num)
				if Prime.prime?(p) && Prime.prime?(q)
					break
				end
			end
		
			n = p*q
			fiofn = (p-1)*(q-1)
			e = rand(num)
		
			while(1) do
				e = rand(num)
				if e != Prime.prime_division(n) && 1 < e && e < fiofn then
					break
				end
			end
			d = 1
			while((d*e)%fiofn !=)
				d = d + 1
			end
			key[0] = n
			key[1] = e
			key[2] = d
		
			@rsa = Rsas.new(n:key[0],e:key[1],d:key[2])
	
		end

		respond_to do |format|
			if @rsas.save
				format.json { render json {'id' => @rsas.id} }
			end
		end
    end
  end

  # PATCH/PUT /rsas/1
  # PATCH/PUT /rsas/1.json
  def update
    respond_to do |format|
      if @rsa.update(rsa_params)
        format.html { redirect_to @rsa, notice: 'Rsas was successfully updated.' }
        format.json { render :show, status: :ok, location: @rsa }
      else
        format.html { render :edit }
        format.json { render json: @rsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsas/1
  # DELETE /rsas/1.json
  def destroy
    @rsa.destroy
    respond_to do |format|
      format.html { redirect_to rsas_index_url, notice: 'Rsas was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsa
      @rsa = Rsas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsa_params
     params.require(:rsas).permit(:n, :e, :d)
    end
end
