class Account::OridsController < ApplicationController
  before_action :authenticate_user!

  def index
    @orids = current_user.orids
  end

  def markdown
    @orid = Orid.find(params[:id])

    text = "
            <h3>Objective</h3>
            <p>#{@orid.objective}</p>
            <br>
            <h3>Reflective</h3>
            <p>#{@orid.reflective}</p>
            <br>
            <h3>Interpretive</h3>
            <p>#{@orid.interpretive}</p>
            <br>
            <h3>Decisional</h3>
            <p>#{@orid.decisional}</p>
          "

    @markdown = ReverseMarkdown.convert(text)
  end
end
