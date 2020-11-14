require 'test_helper'

class TurmasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turma = turmas(:one)
  end

  test "should get index" do
    get turmas_url, as: :json
    assert_response :success
  end

  test "should create turma" do
    assert_difference('Turma.count') do
      post turmas_url, params: { turma: { name: @turma.name, user_id: @turma.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show turma" do
    get turma_url(@turma), as: :json
    assert_response :success
  end

  test "should update turma" do
    patch turma_url(@turma), params: { turma: { name: @turma.name, user_id: @turma.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy turma" do
    assert_difference('Turma.count', -1) do
      delete turma_url(@turma), as: :json
    end

    assert_response 204
  end
end
