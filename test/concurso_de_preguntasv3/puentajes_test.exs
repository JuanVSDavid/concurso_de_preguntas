defmodule ConcursoDePreguntasv3.PuentajesTest do
  use ConcursoDePreguntasv3.DataCase

  alias ConcursoDePreguntasv3.Puentajes

  describe "puntajes" do
    alias ConcursoDePreguntasv3.Puentajes.Puntaje

    import ConcursoDePreguntasv3.PuentajesFixtures

    @invalid_attrs %{puntaje: nil}

    test "list_puntajes/0 returns all puntajes" do
      puntaje = puntaje_fixture()
      assert Puentajes.list_puntajes() == [puntaje]
    end

    test "get_puntaje!/1 returns the puntaje with given id" do
      puntaje = puntaje_fixture()
      assert Puentajes.get_puntaje!(puntaje.id) == puntaje
    end

    test "create_puntaje/1 with valid data creates a puntaje" do
      valid_attrs = %{puntaje: 42}

      assert {:ok, %Puntaje{} = puntaje} = Puentajes.create_puntaje(valid_attrs)
      assert puntaje.puntaje == 42
    end

    test "create_puntaje/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Puentajes.create_puntaje(@invalid_attrs)
    end

    test "update_puntaje/2 with valid data updates the puntaje" do
      puntaje = puntaje_fixture()
      update_attrs = %{puntaje: 43}

      assert {:ok, %Puntaje{} = puntaje} = Puentajes.update_puntaje(puntaje, update_attrs)
      assert puntaje.puntaje == 43
    end

    test "update_puntaje/2 with invalid data returns error changeset" do
      puntaje = puntaje_fixture()
      assert {:error, %Ecto.Changeset{}} = Puentajes.update_puntaje(puntaje, @invalid_attrs)
      assert puntaje == Puentajes.get_puntaje!(puntaje.id)
    end

    test "delete_puntaje/1 deletes the puntaje" do
      puntaje = puntaje_fixture()
      assert {:ok, %Puntaje{}} = Puentajes.delete_puntaje(puntaje)
      assert_raise Ecto.NoResultsError, fn -> Puentajes.get_puntaje!(puntaje.id) end
    end

    test "change_puntaje/1 returns a puntaje changeset" do
      puntaje = puntaje_fixture()
      assert %Ecto.Changeset{} = Puentajes.change_puntaje(puntaje)
    end
  end
end
