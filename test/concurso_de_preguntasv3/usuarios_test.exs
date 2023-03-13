defmodule ConcursoDePreguntasv3.UsuariosTest do
  use ConcursoDePreguntasv3.DataCase

  alias ConcursoDePreguntasv3.Usuarios

  describe "usuarios" do
    alias ConcursoDePreguntasv3.Usuarios.Usuario

    import ConcursoDePreguntasv3.UsuariosFixtures

    @invalid_attrs %{email: nil, name: nil, password: nil}

    test "list_usuarios/0 returns all usuarios" do
      usuario = usuario_fixture()
      assert Usuarios.list_usuarios() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Usuarios.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      valid_attrs = %{email: "some email", name: "some name", password: "some password"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.create_usuario(valid_attrs)
      assert usuario.email == "some email"
      assert usuario.name == "some name"
      assert usuario.password == "some password"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      update_attrs = %{email: "some updated email", name: "some updated name", password: "some updated password"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.update_usuario(usuario, update_attrs)
      assert usuario.email == "some updated email"
      assert usuario.name == "some updated name"
      assert usuario.password == "some updated password"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_usuario(usuario, @invalid_attrs)
      assert usuario == Usuarios.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Usuarios.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_usuario(usuario)
    end
  end

  describe "usuarios" do
    alias ConcursoDePreguntasv3.Usuarios.Usuario

    import ConcursoDePreguntasv3.UsuariosFixtures

    @invalid_attrs %{email: nil, nombre: nil, password: nil}

    test "list_usuarios/0 returns all usuarios" do
      usuario = usuario_fixture()
      assert Usuarios.list_usuarios() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Usuarios.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      valid_attrs = %{email: "some email", nombre: "some nombre", password: "some password"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.create_usuario(valid_attrs)
      assert usuario.email == "some email"
      assert usuario.nombre == "some nombre"
      assert usuario.password == "some password"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      update_attrs = %{email: "some updated email", nombre: "some updated nombre", password: "some updated password"}

      assert {:ok, %Usuario{} = usuario} = Usuarios.update_usuario(usuario, update_attrs)
      assert usuario.email == "some updated email"
      assert usuario.nombre == "some updated nombre"
      assert usuario.password == "some updated password"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_usuario(usuario, @invalid_attrs)
      assert usuario == Usuarios.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Usuarios.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_usuario(usuario)
    end
  end
end
