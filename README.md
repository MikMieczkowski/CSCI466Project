# Karaoke Queue Management System

A full-stack karaoke management application built with **PHP** and **MySQL** that allows singers to browse and request songs while providing DJs with tools to manage the performance queue.

## Features

* User interface for requesting karaoke songs
* DJ dashboard for managing the performance queue
* Relational MySQL database with normalized schema
* Queue management for singers and song requests
* Song catalog with artist, version, and media information
* Contributor tracking through many-to-many database relationships

## Technologies

* PHP
* MySQL
* SQL
* HTML/CSS

## Database Design

The project uses a relational database consisting of:

* **Singer** – stores performer information
* **Song** – stores song metadata
* **Queue** – tracks requested performances
* **Contributors** – stores featured artists
* **Feature** – junction table connecting songs and contributors

The schema demonstrates foreign keys, composite primary keys, and many-to-many relationships.

## Project Structure

* `WebInterface.php` – singer-facing application
* `DJInterface.php` – DJ queue management interface
* `createRelations.sql` – database schema and sample data
* ER diagram and database design documentation

## Learning Outcomes

This project demonstrates:

* Relational database design
* SQL schema creation and normalization
* PHP server-side development
* CRUD operations
* Database-driven web applications
* Foreign key relationships and query design

## Screenshots

*Add screenshots of the singer interface and DJ dashboard here.*

## Future Improvements

* User authentication
* Song search and filtering
* Queue reordering through drag-and-drop
* Mobile-friendly interface
* Administrative dashboard
* Real-time queue updates
