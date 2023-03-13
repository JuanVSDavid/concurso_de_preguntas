defmodule ConcursoDePreguntasv3.JuegosTest do
  use ConcursoDePreguntasv3.DataCase

  alias ConcursoDePreguntasv3.Juegos

  describe "juegos" do
    alias ConcursoDePreguntasv3.Juegos.Juego

    import ConcursoDePreguntasv3.JuegosFixtures

    @invalid_attrs %{descripcion: nil, privado: nil, titulo: nil}

    test "list_juegos/0 returns all juegos" do
      juego = juego_fixture()
      assert Juegos.list_juegos() == [juego]
    end

    test "get_juego!/1 returns the juego with given id" do
      juego = juego_fixture()
      assert Juegos.get_juego!(juego.id) == juego
    end

    test "create_juego/1 with valid data creates a juego" do
      valid_attrs = %{descripcion: "some descripcion", privado: true, titulo: "some titulo"}

      assert {:ok, %Juego{} = juego} = Juegos.create_juego(valid_attrs)
      assert juego.descripcion == "some descripcion"
      assert juego.privado == true
      assert juego.titulo == "some titulo"
    end

    test "create_juego/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Juegos.create_juego(@invalid_attrs)
    end

    test "update_juego/2 with valid data updates the juego" do
      juego = juego_fixture()
      update_attrs = %{descripcion: "some updated descripcion", privado: false, titulo: "some updated titulo"}

      assert {:ok, %Juego{} = juego} = Juegos.update_juego(juego, update_attrs)
      assert juego.descripcion == "some updated descripcion"
      assert juego.privado == false
      assert juego.titulo == "some updated titulo"
    end

    test "update_juego/2 with invalid data returns error changeset" do
      juego = juego_fixture()
      assert {:error, %Ecto.Changeset{}} = Juegos.update_juego(juego, @invalid_attrs)
      assert juego == Juegos.get_juego!(juego.id)
    end

    test "delete_juego/1 deletes the juego" do
      juego = juego_fixture()
      assert {:ok, %Juego{}} = Juegos.delete_juego(juego)
      assert_raise Ecto.NoResultsError, fn -> Juegos.get_juego!(juego.id) end
    end

    test "change_juego/1 returns a juego changeset" do
      juego = juego_fixture()
      assert %Ecto.Changeset{} = Juegos.change_juego(juego)
    end
  end
end
