class MatchController < ApplicationController
  #アピールされたリスト表示
  def appealed_list_view
    if session[:creator] != nil
      @match = User.joins(:matches).where(matches: {is_ok: nil}).where(users: {id: Match.where(target_user_id: session[:id]).select("matches.user_id")}).select("users.*", "users.id AS page_id", "matches.*", "matches.created_at AS match_time").order("matches.created_at ASC")
      render :appealed_list
    else
      redirect_to "/index"
    end
  end

  #マッチングリスト
  def matching_list_view
    if session[:id] != nil
      @match = User.joins(:matches).select("users.*", "users.id AS page_id", "matches.*", "matches.created_at AS match_time").where(matches: {is_ok: true}).where(matches: {target_user_id: session[:id]}).where(users: {id: Match.where(target_user_id: session[:id]).select("matches.user_id")}).order("matches.created_at ASC")
      @message_list = MessageList.new
      render :matching
    else
      redirect_to "/index"
    end
  end

  #話してみるボタン
  def appeal_answer_ok
    if session[:creator] != nil
      match = Match.where(user_id: params[:id]).where(target_user_id: session[:id])
      if match.update_all(:is_ok => 1)
        flash[:success] = "success"
        redirect_to "/appeal/list"
      else
        flash[:danger] = "エラー"
        redirect_to "/appeal/list"
      end
    else
      redirect_to "/index"
    end
  end

  #ごめなさいボタン
  def appeal_answer_sorry
    if session[:creator] != nil
      match = Match.where(user_id: params[:id]).where(target_user_id: session[:id])
      if match.update_all(:is_ok => 0)
        flash[:success] = "success"
        redirect_to "/match/appeal/list"
      else
        flash[:danger] = "エラー"
        redirect_to "match/appeal/list"
      end
    else
      redirect_to "/index"
    end
  end

  #アピールボタン
  def appeal_send
    if session[:id] != nil
      @match = Match.new(user_id: session[:id], target_user_id: params[:id], is_scout: false)
      if @match.save
        flash[:success] = "success"
        redirect_to "/page/creator/#{params[:id]}"
      else
        redirect_to "/page/creator/#{params[:id]}"
      end
    else
      redirect_to "/index"
    end
  end

  #アピールした一覧
  def appeal_check
    if session[:id] != nil && session[:creator] == nil
      @match = Match.new
      @appeal = User.joins(:matches, :creators).select("users.*", "users.id AS page_id", "matches.*", "matches.created_at AS match_time", "creators.*").where(matches: {user_id: session[:id]}).where(matches: {is_ok: nil}).order("matches.created_at ASC")
      render :appeal_show
    else
      redirect_to "/index"
    end
  end

  #スカウトボタン
  def scout_send
    if session[:creator] != nil
      scout = Match.new(user_id: params[:id], target_user_id: session[:id], is_scout: true)
      if scout.save
        flash[:success] = "success"
        redirect_to "/page/heir/#{params[:id]}"
      else
        flash[:danger] = "エラー"
        redirect_to "/page/heir/#{params[:id]}"
      end
    else
      redirect_to "/index"
    end
  end

  #スカウトアンサーOK
  def scout_answer_ok
    if session[:id] != nil && session[:creator] == nil
      scout = Match.where(is_scout: true).where(user_id: session[:id]).where(target_user_id: params[:id])
      if scout.update_all(:is_ok => true)
        flash[:success] = "スカウトアンサー"
        redirect_to "/scouted/list"
      else
        flash[:danger] = "スカウトアンサー"
        redirect_to "/scouted/list"
      end
    else
      redirect_to "/index"
    end
  end

  #スカウトアンサーNO
  def scout_answer_sorry
    if session[:id] != nil && session[:creator] == nil
      scout = Match.where(is_scout: true).where(user_id: session[:id]).where(target_user_id: params[:id])
      if scout.update_all(:is_ok => false)
        flash[:success] = "success"
        redirect_to "/scouted/list"
      else
        flash[:danger] = "エラー"
        redirect_to "/scouted/list"
      end
    else
      redirect_to "/index"
    end
  end

  #スカウト一覧
  def scouted_show
    if session[:id]!= nil && session[:creator] == nil
      @match = Match.new
      @scout = User.joins(:matches, :creators).select("users.*", "users.id AS page_id", "matches.*", "matches.created_at AS match_time", "creators.*").where(users: {id: Match.where(user_id: session[:id]).select("matches.target_user_id")}).where(matches: {is_scout: true}).where(matches: {is_ok: nil}).order("matches.created_at ASC")
      render :scout_check
    else
      redirect_to "/index"
    end
  end

  #スカウトした一覧
  def scout_check
    if session[:creator] != nil
      @scout = User.joins(:matches).select("users.*", "users.id AS page_id" "matches.*", "matches.created_at AS match_time").where(matches: {target_user_id: session[:id]}).where(matches: {user_id: params[:id]}).where(matches: {is_scout: true}).order("matches.created_at ASC")
    else
      redirect_to "/index"
    end
  end
end
