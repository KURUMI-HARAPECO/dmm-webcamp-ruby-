# controllersフォルダ内のファイルは、ビューとモデルへの司令を処理として記述します。

class TodolistsController < ApplicationController
  def new
        # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
    # @のついているインスタンス変数はビューファイルへ受け渡すことができます。
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    # ローカル変数は、ビューファイルに受け渡しができません。アクション内でしか利用できません。
    list.save
    # ３. トップ画面へリダイレクト
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
     @list = List.find(params[:id])
    # /todolists/:id内の:idは、アクション内にparams[:id]と記述することで取得できます。
    # 今回はレコード1件を取得するので、インスタンス変数名は単数形の「@list」にします。
  end

  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to todolists_path  # 投稿一覧画面へリダイレクト
  end



  private
  # privateは一種の境界線で、「ここから下はcontrollerの中でしか呼び出せません」という意味
  # privateはControllerファイルの一番下のendのすぐ上に書いて下さい。
  def list_params
    # paramsはRailsで送られてきた値を受け取るためのメソッドです。
    # requireでデータのオブジェクト名(ここでは:list)を指定し、permitでキー（:title,:body）を指定しています。
    params.require(:list).permit(:title, :body, :image)
  end
#ストロングパラメータは、フォームの入力値をコントローラのcreateやupdateに渡す役割があります。さらにハッキングなどで不正に入力値を奪われないために、controllerの中でしか呼び出せないようにする役割もあります。
# コントローラに「def list_params...」を直接書いてしまうと、アクションとして認識されてしまいます。しかし、コントローラに「def list_params...」を直接書いてしまうと、アクションとして認識されてしまいます。

end
