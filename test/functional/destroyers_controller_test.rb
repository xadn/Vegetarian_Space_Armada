require 'test_helper'

class DestroyersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Destroyer.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Destroyer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Destroyer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to destroyer_url(assigns(:destroyer))
  end

  def test_edit
    get :edit, :id => Destroyer.first
    assert_template 'edit'
  end

  def test_update_invalid
    Destroyer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Destroyer.first
    assert_template 'edit'
  end

  def test_update_valid
    Destroyer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Destroyer.first
    assert_redirected_to destroyer_url(assigns(:destroyer))
  end

  def test_destroy
    destroyer = Destroyer.first
    delete :destroy, :id => destroyer
    assert_redirected_to destroyers_url
    assert !Destroyer.exists?(destroyer.id)
  end
end
