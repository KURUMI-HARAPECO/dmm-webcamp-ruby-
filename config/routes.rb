# routes.rbファイルは、URLをどのコントローラのどのアクションで処理するかを記述します。
# HTTPメソッド 'URL' => 'コントローラ#アクション'
Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  # URL「top」にアクセスしたときに、homesコントローラのtopアクションが呼び出される
  post 'todolists' => 'todolists#create'
  get 'todolists' => 'todolists#index'
  # .../todolists/1 や .../todolists/3 に該当する
  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  get 'todolists/:id/edit' => 'todolists#edit',as: 'edit_todolist'
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end


# 代表的なHTTPメソッドは、「GET」「POST」「DELETE」の3種類です。

# GET：リソースの取得
# ブラウザからサーバーへURLを送信し、ウェブページを取得（GET）します。
# 単にウェブサイトを閲覧する際は、GETメソッドが使われます。

# POST：リソースの更新、リソースへのデータ追加 など
# ブラウザからサーバーへ、URL以外のデータも送信（POST）して処理を命令します。
# 会員情報の登録、記事投稿など、サーバーに情報を送信する際に使用します。

# DELETE：リソースの削除
# ブラウザからサーバーへ、URL以外のデータ削除のための情報も送信して処理を命令します。
# 会員情報の削除、記事削除など、情報を削除する際に使用します。