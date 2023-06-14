<?php



    class Tablero

    {



        function get_news_vacantes($oCon)

        {

            $sql = "CALL sp_get_vacantes_nuevas()";

            $res = select($oCon, $sql);

            $html = "";



            if(is_array($res))

            {

                if(count($res) > 0)

                {

                    foreach($res as $item)

                    {

                        $html .= '

                                <li>

                                    <h3>'.$item["Id"].' - Empresa: '.$item["Nombre_empresa"].', solicita '.$item["Posicion_requerida"].' - '.$item["Provincia"].'</h3>

                                    <p>'.$item["Fecha_creacion"].'</p>

                                    <button class="view-button" data-vacante-id="'.$item["Id"].'">Ver vacante</button>

                                </li>';

                    }

                }

                else

                {

                    $html = "No hay vacantes disponibles";

                }

            }

            else

            {

                $html = "No es array";

            }



            return $html;

        }



        function get_published_vacantes($oCon)

        {

            $sql = "CALL sp_get_vacantes_publicadas()";

            $res = select($oCon, $sql);

            $html = "";



            if(is_array($res))

            {

                if(count($res) > 0)

                {

                    foreach($res as $item)

                    {

                        $html .= '

                                <li>

                                <h3>'.$item["Id"].' - Empresa: '.$item["Nombre_empresa"].', solicita '.$item["Posicion_requerida"].' - '.$item["Provincia"].'</h3>

                                <p>'.$item["Fecha_creacion"].'</p>

                                <button class="view-button" data-vacante-id="'.$item["Id"].'">Ver vacante</button>

                            </li>';

                    }

                }

                else

                {

                    $html = "No hay vacantes disponibles";

                }

            }

            else

            {

                $html = "No es array";

            }



            return $html;

        }



    }



?>