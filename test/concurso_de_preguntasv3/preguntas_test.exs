defmodule ConcursoDePreguntasv3.PreguntasTest do
  use ConcursoDePreguntasv3.DataCase

  alias ConcursoDePreguntasv3.Preguntas

  describe "preguntas" do
    alias ConcursoDePreguntasv3.Preguntas.Pregunta

    import ConcursoDePreguntasv3.PreguntasFixtures

    @invalid_attrs %{enunciado: nil, nivel: nil, opciones: nil, privado: nil, puntos: nil, respuesta: nil}

    test "list_preguntas/0 returns all preguntas" do
      pregunta = pregunta_fixture()
      assert Preguntas.list_preguntas() == [pregunta]
    end

    test "get_pregunta!/1 returns the pregunta with given id" do
      pregunta = pregunta_fixture()
      assert Preguntas.get_pregunta!(pregunta.id) == pregunta
    end

    test "create_pregunta/1 with valid data creates a pregunta" do
      valid_attrs = %{enunciado: "some enunciado", nivel: "some nivel", opciones: ["option1", "option2"], privado: true, puntos: 42, respuesta: "some respuesta"}

      assert {:ok, %Pregunta{} = pregunta} = Preguntas.create_pregunta(valid_attrs)
      assert pregunta.enunciado == "some enunciado"
      assert pregunta.nivel == "some nivel"
      assert pregunta.opciones == ["option1", "option2"]
      assert pregunta.privado == true
      assert pregunta.puntos == 42
      assert pregunta.respuesta == "some respuesta"
    end

    test "create_pregunta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Preguntas.create_pregunta(@invalid_attrs)
    end

    test "update_pregunta/2 with valid data updates the pregunta" do
      pregunta = pregunta_fixture()
      update_attrs = %{enunciado: "some updated enunciado", nivel: "some updated nivel", opciones: ["option1"], privado: false, puntos: 43, respuesta: "some updated respuesta"}

      assert {:ok, %Pregunta{} = pregunta} = Preguntas.update_pregunta(pregunta, update_attrs)
      assert pregunta.enunciado == "some updated enunciado"
      assert pregunta.nivel == "some updated nivel"
      assert pregunta.opciones == ["option1"]
      assert pregunta.privado == false
      assert pregunta.puntos == 43
      assert pregunta.respuesta == "some updated respuesta"
    end

    test "update_pregunta/2 with invalid data returns error changeset" do
      pregunta = pregunta_fixture()
      assert {:error, %Ecto.Changeset{}} = Preguntas.update_pregunta(pregunta, @invalid_attrs)
      assert pregunta == Preguntas.get_pregunta!(pregunta.id)
    end

    test "delete_pregunta/1 deletes the pregunta" do
      pregunta = pregunta_fixture()
      assert {:ok, %Pregunta{}} = Preguntas.delete_pregunta(pregunta)
      assert_raise Ecto.NoResultsError, fn -> Preguntas.get_pregunta!(pregunta.id) end
    end

    test "change_pregunta/1 returns a pregunta changeset" do
      pregunta = pregunta_fixture()
      assert %Ecto.Changeset{} = Preguntas.change_pregunta(pregunta)
    end
  end
end
