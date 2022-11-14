<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="instructions">

    <spring:url value="/resources/images/pets.png" var="petsImage"/>

    <h2>Instrucciones del Dobble</h2>
    <p>El objetivo de todos los minijuegos del Dobble es encontrar el símbolo idéntico más rápido que tus oponentes. 
        El número de jugadores permitidos es de entre dos y ocho.
    </p>
    <p>Aquí se podrá jugar a los siguientes minijuegos del Dobble</p>
    <br></br>

    <h3>La Torre Infernal</h3>

    <p>Consiste en repartir una carta boca abajo por cada jugador que participe en la partida, poniendo el resto de cartas bocarriba 
        en una pila en el centro de la pantalla. A la cuenta de tres, las cartas de todos los jugadores se darán la vuelta y los jugadores comenzarán a buscar 
        el símbolo idéntico respecto del montón que se halla en el centro de la pantalla. El jugador que lo encuentre primero, se llevará la carta del montón,
        acumulándola en su mano obligando a que el resto de jugadores tome como nueva referencia la siguiente carta del montón. 
        Cuando no queden más cartas en el centro, el jugador con más cartas ganará la ronda.</p>
    
    <br></br>

    <h3>El Foso</h3>
    <p>La mecánica es similar al anterior pero a la inversa, se repartirán todas las cartas boca abajo a cada uno de los jugadores excepto la última 
        que se deja boca arriba. El juego consiste en deshacerse de todas las cartas antes que sus adversarios. A la cuenta de tres, se le da la vuelta a la primera 
        carta de cada uno de los jugadores, que deben buscar la imágen idéntica con la central. El jugador que la encuentre primero la sustituirá por la que había 
        común para todos, deshaciéndose permanentemente de dicha carta y por tanto mostrando para el resto de jugadores la descartada. El juego lo perderá el último 
        en deshacerse de sus cartas.</p>

    <br></br>
    <h3>La Patata Caliente</h3>
    <p>La patata caliente se reparte una carta boca abajo a cada jugador, dejando de lado el resto de las cartas para las siguientes rondas del propio minijuego.
         El objetivo es ser más rápido que el resto de jugadores en deshacerse de mi carta. Para ello a la cuenta de tres, las cartas de todos los jugadores se 
         desvelarán a la vez, tomando de referencia el resto de cartas con respecto a la del jugador para encontrar el símbolo idéntico y darle su carta al jugador 
         al que pertenezca dicho símbolo. El jugador que se quede con todas las cartas perderá la ronda.</p>

</petclinic:layout>