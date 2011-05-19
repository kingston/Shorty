require 'bcrypt'

class UrlsController < ApplicationController
  include BCrypt
  before_filter :authenticate, :except => :redirect

  def index
    @urlEntry = UrlEntry.new
    @entries = UrlEntry.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @entries }
    end
  end
  
  def create
    @urlEntry = UrlEntry.new(params[:url_entry])
    respond_to do |format|
      @urlEntry.url = "http://www.badattachment.com" unless @urlEntry.attachment.nil?
      if @urlEntry.save
        #Replace URL
        unless @urlEntry.attachment.nil?
          @urlEntry.url = "http://" + request.host + (request.port != 80 ? ":" + request.port.to_s : "") + @urlEntry.attachment.url
          @urlEntry.save
        end
        format.html { redirect_to(url_entries_path,
                      :notice => "URL entry successfully added!")}
        format.xml { render :xml => @urlEntry,
                     :status => :created }
      else
        format.html { redirect_to(url_entries_path,
                      :notice => "Error adding URL entry.")}
        format.xml { render :xml => @urlEntry.errors,
                            :status => unprocessable_entity }
      end
    end
  end
  
  def update
    @entry = UrlEntry.find(params[:id])
    
    respond_to do |format|
      if @entry.update_attributes(params[:id])
        format.html { redirect_to(url_entries_path,
                      :notice => "URL entry successfully updated!")}
        format.xml { head :ok }
      else
        format.html { redirect_to(url_entries_path,
                      :notice => "Error updating URL entry.")}
        format.xml { render :xml => @entry.errors,
                            :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = UrlEntry.find(params[:id])
    @entry.destroy
    
    respond_to do |format|
      format.html { redirect_to(url_entries_url) }
      format.xml { head :ok }
    end
  end

  def redirect
    key = params[:key].blank? ? "default" : params[:key]
    @entry = UrlEntry.find_by_key(key) || not_found
    redirect_to @entry.url
  end
  
protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      Password.new(Settings.site_password) == password
    end
  end
end
