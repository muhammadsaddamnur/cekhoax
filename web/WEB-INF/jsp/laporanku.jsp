<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.cekhoax.bean.*,org.hibernate.*,org.hibernate.cfg.*" %>
<!doctype html>
<!--
  Material Design Lite
  Copyright 2015 Google Inc. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>cekhoax</title>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.deep_purple-pink.min.css">
    <link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet" type="text/css" />
    <style>
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 40px;
      z-index: 900;
    }
    </style>
  </head>
  <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
          <h3>cekhoax.com</h3>
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark">
          <a href="index.htm" class="mdl-layout__tab">Hot</a>
            <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                        out.print("");
                    }
                    else{
                        out.print("<a href='laporanku.htm' class='mdl-layout__tab is-active'>Laporanku</a>");
                        out.print("<a href='profil.htm' class='mdl-layout__tab'>"+session.getAttribute("userid")+"</a>");
                        out.print("<a href='logout.htm' class='mdl-layout__tab'>Keluar</a>");
                    }
            %>

          <a href="input.htm">
          <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored mdl-shadow--4dp mdl-color--accent" id="add">
            <i class="material-icons" role="presentation">add</i>
            <span class="visuallyhidden">Add</span>
          </button>
          </a>
        </div>
      </header>
      <main class="mdl-layout__content">
        <div class="mdl-layout__tab-panel is-active" id="overview">
          
            
            <%! String judul;String epost; String alasan; String link; String unama; int idnama; Date tanggal; int idpost; Session session1 = null; %>
            <%
                Configuration cf=new Configuration();
                cf.configure();
                SessionFactory sf = cf.buildSessionFactory();
                session1 =sf.openSession();
//Using from Clause
                String SQL_QUERY2 ="from User where username ='"+session.getAttribute("userid")+"'";
                Query query2 = session1.createQuery(SQL_QUERY2);
                Iterator it2=query2.iterate();
                while(it2.hasNext()){
           
                    User e2=(User)it2.next();
                    idnama = e2.getIdNama();
                }

                String SQL_QUERY ="from Post where id_nama ='"+idnama+"'order by id_post desc";
                Query query = session1.createQuery(SQL_QUERY);
                Iterator it=query.iterate();
                
                while(it.hasNext())
                {
                        Post e=(Post)it.next();
                        judul=e.getJudul();
                        epost=e.getPost();
                        alasan=e.getAlasan();
                        link = e.getLink();
                        tanggal = e.getTanggal();
                        idpost = e.getIdPost();


            %>
            
            
            <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
              <i class="material-icons">link</i>
            </header>
            <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
              <div class="mdl-card__supporting-text">
                <h4><%=judul%></h4>
                <%=epost%> <br>
                <br>
                <b>Alasan :</b>
                <%=alasan%> <br>
                <br>
                <b>Sumber dari :</b>
                <a href="<%=link%>"><%=link%>/</a> <br>
                <b>Dilaporkan Pada :</b>
                <%=tanggal%> <br>
                <b>Pelapor :</b>
                <%=session.getAttribute("userid")%> <br>
              </div>
              <div class="mdl-card__actions">
                <a href="update.htm?id_post=<%=idpost%>&id_nama=<%=idpost%>&judul=<%=judul%>&epost=<%=epost%>&link=<%=link%>&alasan=<%=alasan%>" class="mdl-button">Edit</a>
                <a href="delete.htm?id_post=<%=idpost%>" class="mdl-button">Hapus</a>
              </div>
            </div>

            <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right" for="btn1">
              <li class="mdl-menu__item">Lorem</li>
              <li class="mdl-menu__item" disabled>Ipsum</li>
              <li class="mdl-menu__item">Dolor</li>
            </ul>
                    </section>
                  <br>
                  <br>
                  
              <%
                }
                session1.close();
              %>
          
          
          
        </div>
               
        <footer class="mdl-mega-footer">
          <div class="mdl-mega-footer--bottom-section">
              <a href="index.jsp"></a>
            <div class="mdl-logo">
              copyright 
            </div>
            <ul class="mdl-mega-footer--link-list">
              <li><a href="https://github.com/muhammadsaddamnur/">saddam</a></li>
              <li><a href="https://github.com/siscofran999/">fransisco</a></li>
              <li><a href="https://github.com/relic8's/">indra</a></li>
              <li><a href="https://github.com/nurrizky's/">nurizky</a></li>
            </ul>
          </div>
        </footer>
      </main>
    </div>
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
  </body>
</html>
