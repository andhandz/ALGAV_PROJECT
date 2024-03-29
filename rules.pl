:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

%:- use_module(library(http/http_unix_daemon)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_open)).
:- use_module(library(http/http_cors)).
:- use_module(library(date)).
:- use_module(library(random)).

% Bibliotecas JSON
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).
:- json_object agenda_maq_json_array(array:list(agenda_maq_json)).
:- json_object agenda_maq_json(maquina:string,agenda_array:list(agenda_json)).
:- json_object agenda_json(instanteInicial:float,instanteFinal:float,tipoProcessamento:string,lista:list(string)).
:- set_setting(http:cors, [*]).

:-http_handler('/paths',get_paths,[]).

server(Port) :-
	init,
        http_server(http_dispatch, [port(Port)]).
get_paths(Request):-
    cors_enable(Request, [methods([get])]),
    give_best_paths(FL),
    prolog_to_json(FL,JSONObject),
    reply_json(JSONObject, [json_object(dict)]).


        
        
idStore('Arouca', 1).
idStore('Espinho', 2).
idStore('Gondomar', 3).
idStore('Maia', 4).
idStore('Matosinhos', 5).
idStore('Oliveira de Azemeis', 6).
idStore('Paredes', 7).
idStore('Porto', 8).
idStore('Povoa de Varzim', 9).
idStore('Santa Maria da Feira', 10).
idStore('Santo Tirso', 11).
idStore('Sao Joao da Madeira', 12).
idStore('Trofa', 13).
idStore('Vale de Cambra', 14).
idStore('Valongo', 15).
idStore('Vila do Conde', 16).
idStore('Vila Nova de Gaia', 17).

/*dist(<IdCity>, <distance>, <SecondCityId>) */
dist(1, 0, 1).
dist(1, 53, 2).
dist(1, 57, 3).
dist(1, 67, 4).
dist(1, 65, 5).
dist(1, 30, 6).
dist(1, 44, 7).
dist(1, 57, 8).
dist(1, 92, 9).
dist(1, 37, 10).
dist(1, 80, 11).
dist(1, 29, 12).
dist(1, 83, 13).
dist(1, 22, 14).
dist(1, 64, 15).
dist(1, 85, 16).
dist(1, 56, 17).

dist(2, 52, 1).
dist(2, 0, 2).
dist(2, 28, 3).
dist(2, 31, 4).
dist(2, 27, 5).
dist(2, 34, 6).
dist(2, 48, 7).
dist(2, 22, 8).
dist(2, 55, 9).
dist(2, 17, 10).
dist(2, 51, 11).
dist(2, 24, 12).
dist(2, 53, 13).
dist(2, 43, 14).
dist(2, 37, 15).
dist(2, 47, 16).
dist(2, 18, 17).

dist(3, 56, 1).
dist(3, 28, 2).
dist(3, 0, 3).
dist(3, 19, 4).
dist(3, 18, 5).
dist(3, 46, 6).
dist(3, 29, 7).
dist(3, 10, 8).
dist(3, 45, 9).
dist(3, 35, 10).
dist(3, 34, 11).
dist(3, 40, 12).
dist(3, 36, 13).
dist(3, 47, 14).
dist(3, 10, 15).
dist(3, 38, 16).
dist(3, 13, 17).

dist(4, 68, 1).
dist(4, 30, 2).
dist(4, 20, 3).
dist(4, 0, 4).
dist(4, 12, 5).
dist(4, 59, 6).
dist(4, 34, 7).
dist(4, 12, 8).
dist(4, 32, 9).
dist(4, 43, 10).
dist(4, 24, 11).
dist(4, 52, 12).
dist(4, 14, 13).
dist(4, 60, 14).
dist(4, 16, 15).
dist(4, 18, 16).
dist(4, 14, 17).

dist(5, 64, 1).
dist(5, 25, 2).
dist(5, 18, 3).
dist(5, 11, 4).
dist(5, 0, 5).
dist(5, 55, 6).
dist(5, 35, 7).
dist(5, 9, 8).
dist(5, 30, 9).
dist(5, 37, 10).
dist(5, 32, 11).
dist(5, 45, 12).
dist(5, 25, 13).
dist(5, 56, 14).
dist(5, 18, 15).
dist(5, 23, 16).
dist(5, 9, 17).

dist(6, 9, 1).
dist(6, 34, 2).
dist(6, 47, 3).
dist(6, 58, 4).
dist(6, 55, 5).
dist(6, 0, 6).
dist(6, 60, 7).
dist(6, 48, 8).
dist(6, 83, 9).
dist(6, 18, 10).
dist(6, 70, 11).
dist(6, 11, 12).
dist(6, 73, 13).
dist(6, 11, 14).
dist(6, 55, 15).
dist(6, 75, 16).
dist(6, 47, 17).

dist(7, 45, 1).
dist(7, 48, 2).
dist(7, 28, 3).
dist(7, 32, 4).
dist(7, 35, 5).
dist(7, 60, 6).
dist(7, 0, 7).
dist(7, 33, 8).
dist(7, 60, 9).
dist(7, 55, 10).
dist(7, 28, 11).
dist(7, 53, 12).
dist(7, 39, 13).
dist(7, 61, 14).
dist(7, 20, 15).
dist(7, 52, 16).
dist(7, 38, 17).

dist(8, 58, 1).
dist(8, 23, 2).
dist(8, 8, 3).
dist(8, 12, 4).
dist(8, 9, 5).
dist(8, 48, 6).
dist(8, 32, 7).
dist(8, 0, 8).
dist(8, 37, 9).
dist(8, 32, 10).
dist(8, 28, 11).
dist(8, 42, 12).
dist(8, 30, 13).
dist(8, 50, 14).
dist(8, 15, 15).
dist(8, 29, 16).
dist(8, 7, 17).

dist(9, 90, 1).
dist(9, 51, 2).
dist(9, 44, 3).
dist(9, 30, 4).
dist(9, 29, 5).
dist(9, 81, 6).
dist(9, 59, 7).
dist(9, 35, 8).
dist(9, 0, 9).
dist(9, 64, 10).
dist(9, 36, 11).
dist(9, 71, 12).
dist(9, 24, 13).
dist(9, 82, 14).
dist(9, 42, 15).
dist(9, 4, 16).
dist(9, 35, 17).

dist(10, 37, 1).
dist(10, 17, 2).
dist(10, 34, 3).
dist(10, 41, 4).
dist(10, 38, 5).
dist(10, 18, 6).
dist(10, 53, 7).
dist(10, 30, 8).
dist(10, 65, 9).
dist(10, 0, 10).
dist(10, 57, 11).
dist(10, 8, 12).
dist(10, 58, 13).
dist(10, 21, 14).
dist(10, 43, 15).
dist(10, 58, 16).
dist(10, 29, 17).

dist(11, 81, 1).
dist(11, 51, 2).
dist(11, 35, 3).
dist(11, 22, 4).
dist(11, 31, 5).
dist(11, 71, 6).
dist(11, 29, 7).
dist(11, 29, 8).
dist(11, 35, 9).
dist(11, 57, 10).
dist(11, 0, 11).
dist(11, 65, 12).
dist(11, 9, 13).
dist(11, 73, 14).
dist(11, 31, 15).
dist(11, 34, 16).
dist(11, 34, 17).

dist(12, 29, 1).
dist(12, 24, 2).
dist(12, 40, 3).
dist(12, 51, 4).
dist(12, 48, 5).
dist(12, 10, 6).
dist(12, 53, 7).
dist(12, 41, 8).
dist(12, 76, 9).
dist(12, 8, 10).
dist(12, 63, 11).
dist(12, 0, 12).
dist(12, 66, 13).
dist(12, 13, 14).
dist(12, 48, 15).
dist(12, 68, 16).
dist(12, 40, 17).

dist(13, 81, 1).
dist(13, 44, 2).
dist(13, 36, 3).
dist(13, 14, 4).
dist(13, 25, 5).
dist(13, 71, 6).
dist(13, 38, 7).
dist(13, 25, 8).
dist(13, 25, 9).
dist(13, 59, 10).
dist(13, 9, 11).
dist(13, 65, 12).
dist(13, 0, 13).
dist(13, 73, 14).
dist(13, 21, 15).
dist(13, 19, 16).
dist(13, 27, 17).

dist(14, 22, 1).
dist(14, 44, 2).
dist(14, 48, 3).
dist(14, 58, 4).
dist(14, 56, 5).
dist(14, 11, 6).
dist(14, 60, 7).
dist(14, 48, 8).
dist(14, 83, 9).
dist(14, 21, 10).
dist(14, 71, 11).
dist(14, 13, 12).
dist(14, 73, 13).
dist(14, 0, 14).
dist(14, 55, 15).
dist(14, 76, 16).
dist(14, 47, 17).

dist(15, 64, 1).
dist(15, 38, 2).
dist(15, 10, 3).
dist(15, 15, 4).
dist(15, 18, 5).
dist(15, 55, 6).
dist(15, 20, 7).
dist(15, 16, 8).
dist(15, 44, 9).
dist(15, 45, 10).
dist(15, 31, 11).
dist(15, 48, 12).
dist(15, 22, 13).
dist(15, 56, 14).
dist(15, 0, 15).
dist(15, 36, 16).
dist(15, 21, 17).

dist(16, 85, 1).
dist(16, 46, 2).
dist(16, 39, 3).
dist(16, 20, 4).
dist(16, 23, 5).
dist(16, 75, 6).
dist(16, 53, 7).
dist(16, 29, 8).
dist(16, 4, 9).
dist(16, 58, 10).
dist(16, 35, 11).
dist(16, 65, 12).
dist(16, 19, 13).
dist(16, 76, 14).
dist(16, 36, 15).
dist(16, 0, 16).
dist(16, 30, 17).

dist(17, 57, 1).
dist(17, 18, 2).
dist(17, 14, 3).
dist(17, 16, 4).
dist(17, 12, 5).
dist(17, 47, 6).
dist(17, 38, 7).
dist(17, 8, 8).
dist(17, 39, 9).
dist(17, 30, 10).
dist(17, 36, 11).
dist(17, 37, 12).
dist(17, 29, 13).
dist(17, 48, 14).
dist(17, 22, 15).
dist(17, 31, 16).
dist(17, 0, 17).



%delivery(<id>, <date>, <deliveryMass>, <warehouseId>, <placementTime>, <receiveTime>).
/*delivery(4439, 20221205, 3000, 1, 8, 10).
delivery(4438, 20221205, 3500, 9, 7, 9).
delivery(4445, 20221205, 2000, 3, 5, 7).
delivery(4443, 20221205, 1500, 8, 6, 8).
delivery(4449, 20221205, 900, 11, 15, 20).
delivery(4398, 20221205, 910, 17, 16, 20).
delivery(4432, 20221205, 270, 14, 14, 18).
delivery(4437, 20221205, 180, 12, 9, 11).
delivery(4451, 20221205, 220, 6, 9, 12).
delivery(4452, 20221205, 390, 13, 21, 26).
delivery(4444, 20221205, 380, 2, 20, 25).
delivery(4455, 20221205, 280, 7, 14, 19).
delivery(4399, 20221205, 260, 15, 13, 18).
delivery(4454, 20221205, 350, 10, 18, 22).
delivery(4446, 20221205, 260, 4, 14, 17).
delivery(4456, 20221205, 330, 16, 17, 21).*/

/*delivery(6439, 20230110, 200, 1, 8, 10).
delivery(6438, 20230110, 750, 9, 25, 30).
delivery(6445, 20230110, 1600, 3, 53, 62).
delivery(6443, 20230110, 120, 8, 6, 8).
delivery(6449, 20230110, 300, 11, 15, 20).
delivery(6398, 20230110, 310, 17, 16, 20).
delivery(6432, 20230110, 1700, 14, 55, 65).
delivery(6437, 20230110, 900, 12, 30, 35).
delivery(6451, 20230110, 440, 6, 18, 24).
delivery(6452, 20230110, 1400, 13, 47, 58).
delivery(6444, 20230110, 380, 2, 20, 25).
delivery(6455, 20230110, 560, 7, 28, 38).
delivery(6399, 20230110, 260, 15, 13, 18).
delivery(6454, 20230110, 350, 10, 18, 22).
delivery(6446, 20230110, 260, 4, 14, 17).
delivery(6456, 20230110, 850, 16, 27, 31).*/

/*delivery(5439, 20230109, 200, 1, 8, 10).
delivery(5438, 20230109, 1500, 9, 50, 60).
delivery(5445, 20230109, 1600, 3, 53, 62).
delivery(5443, 20230109, 120, 8, 6, 8).
delivery(5449, 20230109, 300, 11, 15, 20).
delivery(5398, 20230109, 310, 17, 16, 20).
delivery(5432, 20230109, 1700, 14, 55, 65).
delivery(5437, 20230109, 1800, 12, 60, 70).
delivery(5451, 20230109, 440, 6, 18, 24).
delivery(5452, 20230109, 1400, 13, 47, 58).
delivery(5444, 20230109, 380, 2, 20, 25).
delivery(5455, 20230109, 560, 7, 28, 38).
delivery(5399, 20230109, 260, 15, 13, 18).
delivery(5454, 20230109, 350, 10, 18, 22).
delivery(5446, 20230109, 260, 4, 14, 17).
delivery(5456, 20230109, 1300, 16, 45, 55).*/

delivery(7439, 20230111, 2200, 1, 72, 82).
delivery(7438, 20230111, 3000, 9, 95, 110).
delivery(7445, 20230111, 380, 3, 21, 26).
delivery(7443, 20230111, 120, 8, 6, 8).
delivery(7449, 20230111, 300, 11, 15, 20).
delivery(7398, 20230111, 310, 17, 16, 20).
delivery(7432, 20230111, 1700, 14, 55, 65).
delivery(7437, 20230111, 250, 12, 13, 16).
delivery(7451, 20230111, 1440, 6, 48, 59).
delivery(7452, 20230111, 1400, 13, 47, 58).
delivery(7444, 20230111, 380, 2, 20, 25).
delivery(7455, 20230111, 560, 7, 28, 38).
delivery(7399, 20230111, 260, 15, 13, 18).
delivery(7454, 20230111, 350, 10, 18, 22).
delivery(7446, 20230111, 260, 4, 14, 17).
delivery(7456, 20230111, 1500, 16, 50, 59).

truck(eTruck01).
truck(eTruck02).
truck(eTruck03).
truck(eTruck04).
truck(eTruck05).

characteristicsTruck(eTruck01, 7500, 4300, 80, 100, 60,1). /*truckname, tare, loadCap, totBattery, range, BatteryFrom20to80, isActive(0/1)*/
characteristicsTruck(eTruck02, 7500, 3300, 80, 100, 60,1).
characteristicsTruck(eTruck03, 7500, 4800, 80, 100, 60,1).
characteristicsTruck(eTruck04, 7500, 5100, 80, 100, 60,1).
characteristicsTruck(eTruck05, 7500, 2300, 80, 100, 60,1).

pathData(eTruck01,1,2,122,42,0).
pathData(eTruck01,1,3,122,46,0).
pathData(eTruck01,1,4,151,54,25).
pathData(eTruck01,1,5,147,52,25).
pathData(eTruck01,1,6,74,24,0).
pathData(eTruck01,1,7,116,35,0).
pathData(eTruck01,1,8,141,46,0).
pathData(eTruck01,1,9,185,74,53).
pathData(eTruck01,1,10,97,30,0).
pathData(eTruck01,1,11,164,64,40).
pathData(eTruck01,1,12,76,23,0).
pathData(eTruck01,1,13,174,66,45).
pathData(eTruck01,1,14,59,18,0).
pathData(eTruck01,1,15,132,51,24).
pathData(eTruck01,1,16,181,68,45).
pathData(eTruck01,1,17,128,45,0).

pathData(eTruck01,2,1,116,42,0).
pathData(eTruck01,2,3,55,22,0).
pathData(eTruck01,2,4,74,25,0).
pathData(eTruck01,2,5,65,22,0).
pathData(eTruck01,2,6,69,27,0).
pathData(eTruck01,2,7,74,38,0).
pathData(eTruck01,2,8,61,18,0).
pathData(eTruck01,2,9,103,44,0).
pathData(eTruck01,2,10,36,14,0).
pathData(eTruck01,2,11,88,41,0).
pathData(eTruck01,2,12,61,19,0).
pathData(eTruck01,2,13,95,42,0).
pathData(eTruck01,2,14,78,34,0).
pathData(eTruck01,2,15,69,30,0).
pathData(eTruck01,2,16,99,38,0).
pathData(eTruck01,2,17,46,14,0).

pathData(eTruck01,3,1,120,45,0).
pathData(eTruck01,3,2,50,22,0).
pathData(eTruck01,3,4,46,15,0).
pathData(eTruck01,3,5,46,14,0).
pathData(eTruck01,3,6,74,37,0).
pathData(eTruck01,3,7,63,23,0).
pathData(eTruck01,3,8,38,8,0).
pathData(eTruck01,3,9,84,36,0).
pathData(eTruck01,3,10,59,28,0).
pathData(eTruck01,3,11,61,27,0).
pathData(eTruck01,3,12,67,32,0).
pathData(eTruck01,3,13,67,29,0).
pathData(eTruck01,3,14,82,38,0).
pathData(eTruck01,3,15,34,8,0).
pathData(eTruck01,3,16,80,30,0).
pathData(eTruck01,3,17,36,10,0).

pathData(eTruck01,4,1,149,54,25).
pathData(eTruck01,4,2,65,24,0).
pathData(eTruck01,4,3,46,16,0).
pathData(eTruck01,4,5,27,10,0).
pathData(eTruck01,4,6,103,47,0).
pathData(eTruck01,4,7,55,27,0).
pathData(eTruck01,4,8,36,10,0).
pathData(eTruck01,4,9,50,26,0).
pathData(eTruck01,4,10,78,34,0).
pathData(eTruck01,4,11,42,19,0).
pathData(eTruck01,4,12,97,42,0).
pathData(eTruck01,4,13,44,11,0).
pathData(eTruck01,4,14,111,48,0).
pathData(eTruck01,4,15,32,13,0).
pathData(eTruck01,4,16,53,14,0).
pathData(eTruck01,4,17,38,11,0).

pathData(eTruck01,5,1,141,51,24).
pathData(eTruck01,5,2,55,20,0).
pathData(eTruck01,5,3,48,14,0).
pathData(eTruck01,5,4,25,9,0).
pathData(eTruck01,5,6,97,44,0).
pathData(eTruck01,5,7,55,28,0).
pathData(eTruck01,5,8,29,7,0).
pathData(eTruck01,5,9,48,24,0).
pathData(eTruck01,5,10,69,30,0).
pathData(eTruck01,5,11,53,26,0).
pathData(eTruck01,5,12,95,36,0).
pathData(eTruck01,5,13,63,20,0).
pathData(eTruck01,5,14,105,45,0).
pathData(eTruck01,5,15,34,14,0).
pathData(eTruck01,5,16,46,18,0).
pathData(eTruck01,5,17,27,7,0).

pathData(eTruck01,6,1,69,23,0).
pathData(eTruck01,6,2,71,27,0).
pathData(eTruck01,6,3,74,38,0).
pathData(eTruck01,6,4,103,46,0).
pathData(eTruck01,6,5,99,44,0).
pathData(eTruck01,6,7,88,48,0).
pathData(eTruck01,6,8,92,38,0).
pathData(eTruck01,6,9,134,66,45).
pathData(eTruck01,6,10,42,14,0).
pathData(eTruck01,6,11,116,56,30).
pathData(eTruck01,6,12,23,9,0).
pathData(eTruck01,6,13,126,58,33).
pathData(eTruck01,6,14,25,9,0).
pathData(eTruck01,6,15,84,44,0).
pathData(eTruck01,6,16,132,60,35).
pathData(eTruck01,6,17,80,38,0).

pathData(eTruck01,7,1,116,36,0).
pathData(eTruck01,7,2,71,38,0).
pathData(eTruck01,7,3,61,22,0).
pathData(eTruck01,7,4,53,26,0).
pathData(eTruck01,7,5,53,28,0).
pathData(eTruck01,7,6,88,48,0).
pathData(eTruck01,7,8,59,26,0).
pathData(eTruck01,7,9,88,48,0).
pathData(eTruck01,7,10,84,44,0).
pathData(eTruck01,7,11,74,22,0).
pathData(eTruck01,7,12,82,42,0).
pathData(eTruck01,7,13,76,31,0).
pathData(eTruck01,7,14,97,49,21).
pathData(eTruck01,7,15,29,16,0).
pathData(eTruck01,7,16,84,42,0).
pathData(eTruck01,7,17,69,30,0).

pathData(eTruck01,8,1,134,46,0).
pathData(eTruck01,8,2,59,18,0).
pathData(eTruck01,8,3,32,6,0).
pathData(eTruck01,8,4,34,10,0).
pathData(eTruck01,8,5,32,7,0).
pathData(eTruck01,8,6,88,38,0).
pathData(eTruck01,8,7,57,26,0).
pathData(eTruck01,8,9,69,30,0).
pathData(eTruck01,8,10,65,26,0).
pathData(eTruck01,8,11,53,22,0).
pathData(eTruck01,8,12,82,34,0).
pathData(eTruck01,8,13,61,24,0).
pathData(eTruck01,8,14,97,40,0).
pathData(eTruck01,8,15,36,12,0).
pathData(eTruck01,8,16,65,23,0).
pathData(eTruck01,8,17,32,6,0).

pathData(eTruck01,9,1,181,72,50).
pathData(eTruck01,9,2,95,41,0).
pathData(eTruck01,9,3,86,35,0).
pathData(eTruck01,9,4,55,24,0).
pathData(eTruck01,9,5,48,23,0).
pathData(eTruck01,9,6,134,65,42).
pathData(eTruck01,9,7,95,47,0).
pathData(eTruck01,9,8,69,28,0).
pathData(eTruck01,9,10,109,51,24).
pathData(eTruck01,9,11,61,29,0).
pathData(eTruck01,9,12,132,57,31).
pathData(eTruck01,9,13,67,19,0).
pathData(eTruck01,9,14,143,66,45).
pathData(eTruck01,9,15,71,34,0).
pathData(eTruck01,9,16,15,3,0).
pathData(eTruck01,9,17,67,28,0).

pathData(eTruck01,10,1,97,30,0).
pathData(eTruck01,10,2,34,14,0).
pathData(eTruck01,10,3,59,27,0).
pathData(eTruck01,10,4,78,33,0).
pathData(eTruck01,10,5,71,30,0).
pathData(eTruck01,10,6,40,14,0).
pathData(eTruck01,10,7,82,42,0).
pathData(eTruck01,10,8,65,24,0).
pathData(eTruck01,10,9,109,52,25).
pathData(eTruck01,10,11,92,46,0).
pathData(eTruck01,10,12,32,6,0).
pathData(eTruck01,10,13,99,46,0).
pathData(eTruck01,10,14,63,17,0).
pathData(eTruck01,10,15,74,34,0).
pathData(eTruck01,10,16,105,46,0).
pathData(eTruck01,10,17,53,23,0).

pathData(eTruck01,11,1,164,65,42).
pathData(eTruck01,11,2,88,41,0).
pathData(eTruck01,11,3,65,28,0).
pathData(eTruck01,11,4,42,18,0).
pathData(eTruck01,11,5,55,25,0).
pathData(eTruck01,11,6,118,57,31).
pathData(eTruck01,11,7,74,23,0).
pathData(eTruck01,11,8,59,23,0).
pathData(eTruck01,11,9,63,28,0).
pathData(eTruck01,11,10,97,46,0).
pathData(eTruck01,11,12,111,52,25).
pathData(eTruck01,11,13,25,7,0).
pathData(eTruck01,11,14,126,58,33).
pathData(eTruck01,11,15,53,25,0).
pathData(eTruck01,11,16,59,27,0).
pathData(eTruck01,11,17,67,27,0).

pathData(eTruck01,12,1,76,23,0).
pathData(eTruck01,12,2,61,19,0).
pathData(eTruck01,12,3,67,32,0).
pathData(eTruck01,12,4,97,41,0).
pathData(eTruck01,12,5,92,38,0).
pathData(eTruck01,12,6,19,8,0).
pathData(eTruck01,12,7,82,42,0).
pathData(eTruck01,12,8,86,33,0).
pathData(eTruck01,12,9,128,61,37).
pathData(eTruck01,12,10,32,6,0).
pathData(eTruck01,12,11,109,50,23).
pathData(eTruck01,12,13,120,53,26).
pathData(eTruck01,12,14,40,10,0).
pathData(eTruck01,12,15,78,38,0).
pathData(eTruck01,12,16,126,54,28).
pathData(eTruck01,12,17,74,32,0).

pathData(eTruck01,13,1,174,65,42).
pathData(eTruck01,13,2,107,35,0).
pathData(eTruck01,13,3,74,29,0).
pathData(eTruck01,13,4,46,11,0).
pathData(eTruck01,13,5,67,20,0).
pathData(eTruck01,13,6,128,57,31).
pathData(eTruck01,13,7,80,30,0).
pathData(eTruck01,13,8,76,20,0).
pathData(eTruck01,13,9,67,20,0).
pathData(eTruck01,13,10,105,47,0).
pathData(eTruck01,13,11,27,7,0).
pathData(eTruck01,13,12,122,52,25).
pathData(eTruck01,13,14,137,58,33).
pathData(eTruck01,13,15,67,17,0).
pathData(eTruck01,13,16,59,15,0).
pathData(eTruck01,13,17,78,22,0).

pathData(eTruck01,14,1,59,18,0).
pathData(eTruck01,14,2,80,35,0).
pathData(eTruck01,14,3,80,38,0).
pathData(eTruck01,14,4,109,46,0).
pathData(eTruck01,14,5,105,45,0).
pathData(eTruck01,14,6,27,9,0).
pathData(eTruck01,14,7,97,48,0).
pathData(eTruck01,14,8,99,38,0).
pathData(eTruck01,14,9,143,66,45).
pathData(eTruck01,14,10,61,17,0).
pathData(eTruck01,14,11,122,57,31).
pathData(eTruck01,14,12,42,10,0).
pathData(eTruck01,14,13,132,58,35).
pathData(eTruck01,14,15,90,44,0).
pathData(eTruck01,14,16,139,61,37).
pathData(eTruck01,14,17,86,38,0).

pathData(eTruck01,15,1,132,51,24).
pathData(eTruck01,15,2,74,30,0).
pathData(eTruck01,15,3,34,8,0).
pathData(eTruck01,15,4,36,12,0).
pathData(eTruck01,15,5,36,14,0).
pathData(eTruck01,15,6,86,44,0).
pathData(eTruck01,15,7,34,16,0).
pathData(eTruck01,15,8,42,13,0).
pathData(eTruck01,15,9,71,35,0).
pathData(eTruck01,15,10,82,36,0).
pathData(eTruck01,15,11,53,25,0).
pathData(eTruck01,15,12,80,38,0).
pathData(eTruck01,15,13,69,18,0).
pathData(eTruck01,15,14,95,45,0).
pathData(eTruck01,15,16,69,29,0).
pathData(eTruck01,15,17,53,17,0).

pathData(eTruck01,16,1,179,68,45).
pathData(eTruck01,16,2,92,37,0).
pathData(eTruck01,16,3,84,31,0).
pathData(eTruck01,16,4,57,16,0).
pathData(eTruck01,16,5,46,18,0).
pathData(eTruck01,16,6,132,60,35).
pathData(eTruck01,16,7,92,42,0).
pathData(eTruck01,16,8,67,23,0).
pathData(eTruck01,16,9,15,3,0).
pathData(eTruck01,16,10,105,46,0).
pathData(eTruck01,16,11,57,28,0).
pathData(eTruck01,16,12,130,52,25).
pathData(eTruck01,16,13,61,15,0).
pathData(eTruck01,16,14,141,61,37).
pathData(eTruck01,16,15,69,29,0).
pathData(eTruck01,16,17,65,24,0).

pathData(eTruck01,17,1,128,46,0).
pathData(eTruck01,17,2,42,14,0).
pathData(eTruck01,17,3,40,11,0).
pathData(eTruck01,17,4,42,13,0).
pathData(eTruck01,17,5,34,10,0).
pathData(eTruck01,17,6,82,38,0).
pathData(eTruck01,17,7,74,30,0).
pathData(eTruck01,17,8,29,6,0).
pathData(eTruck01,17,9,69,31,0).
pathData(eTruck01,17,10,55,24,0).
pathData(eTruck01,17,11,69,29,0).
pathData(eTruck01,17,12,80,30,0).
pathData(eTruck01,17,13,82,23,0).
pathData(eTruck01,17,14,90,38,0).
pathData(eTruck01,17,15,53,18,0).
pathData(eTruck01,17,16,67,25,0).

factory(5).
/*Phase 1*/

sum_weights([],[],0).
sum_weights([City|LC],[WeightCurrent|LW],WeightCurrent):-
sum_weights(LC,LW,WeightCurrent1),delivery(_,_,Weight,City,_,_),WeightCurrent is Weight+WeightCurrent1.


add_TruckWeight(Tare,[],[Tare]).
add_TruckWeight(Tare,[Weight|LW],[TruckWeight|LWT]):-
add_TruckWeight(Tare,LW,LWT),
TruckWeight is Weight+Tare.


calculate_cost(LC,Cost):-
sum_weights(LC,LW,_),
characteristicsTruck(eTruck01,Tare,_,_,_,_,_),
add_TruckWeight(Tare,LW,LWT),
factory(F),
append([F|LC],[F],LCcomplete),
cost(LCcomplete,LWT,Cost).

cost([_],[],0).
cost([C1,C2|LC],[WT|LWT],Cost):-
cost([C2|LC],LWT,Cost1),
pathData(_,C1,C2,T,_,_),
characteristicsTruck(eTruck01,Ta,ML,_,_,_,_),
Cost is Cost1+T*WT/(Ta+ML).


seq_cost_min(LC,Cost):-(run;true),cost_min(LC,Cost).

run:- retractall(cost_min(_,_)), assertz(cost_min(_,1000000000000000)),
findall(City,delivery(_,_,_,City,_,_),LC),
permutation(LC,LCPerm),
calculate_cost(LCPerm,Cost),
update(LCPerm,Cost),
fail.

update(LCPerm,Cost):-
cost_min(_,CostMin),
((Cost<CostMin,!,retract(cost_min(_,_)),assertz(cost_min(LCPerm,Cost)),
write(Cost),nl);true).

/*Phase 2*/

calculate_cost_2(LS,Time,LCharging):-
 sum_weights(LS,LW,_),
 characteristicsTruck(eTruck01,Tare,_,Energy,_,_,_),
 add_TruckWeight(Tare,LW,LWT),
 factory(SP),
 append([SP|LS],[SP],LScomplete),
 cost_2(LScomplete, LWT, Energy, Time, LCharging).
 
cost_2([_],_,_,0,[]).
cost_2([S1,S2|LS], [WT|LWT], CEnergy, Time, LCharging):-
pathData(_,S1,S2,T,En,Ex_T),characteristicsTruck(eTruck01,Ta,ML,E,_,TCharge,_),NEn is En*WT/(Ta+ML), 
 ((CEnergy-NEn<E*2/10,!, ((S2 is 5, TCharge1 is (max(0,NEn+2/10*E-CEnergy))*TCharge/(6/10*E)); (TCharge1 is (E*8/10-CEnergy)*TCharge/(6/10*E))),
 E1 is max(2/10*E, 8/10*E- NEn), LCharging = [S1|LPreviousCharges]);
 (TCharge1 is 0, E1 is CEnergy-NEn, LCharging = LPreviousCharges)),
 cost_2([S2|LS],LWT,E1,Time1,LPreviousCharges), ((S1 is 5, Ex1_T is 0, RT is 0);(delivery(_,_,_,S1,_,RT), Ex1_T is Ex_T)),
 Time is max(TCharge1,RT)+T*WT/(Ta+ML)+Time1+Ex1_T.
 
 
min_time_seq(LC,LCharging,Time):- get_time(Ti), (run_2;true),minTime(LC,LCharging,Time), get_time(Tf), T is Tf-Ti,
write("Time to generate solution is "), write(T), write("sec").
 
run_2:-
 retractall(minTime(_,_,_)),
 assertz(minTime(_,_,100000)),
 findall(City,delivery(_,_,_,City,_,_),LCities),
 permutation(LCities,LCitiesPerm),
 calculate_cost_2(LCitiesPerm,Time,LCharging),
 update_2(LCitiesPerm,Time,LCharging),
 fail.
 
update_2(LCPerm,Time,LCharging):-
 minTime(_,_,MinTime),
 ((Time<MinTime,!, retract(minTime(_,_,_)), assertz(minTime(LCPerm,LCharging,Time)),
 write('Time='),write(Time), write(' '),write(LCPerm), write(' with recharges at '),write(LCharging),nl)
 ;true).
 
 
 /* Heuristics*/
 
/* Distance Heuristic*/
 
distance_heuristic(Time,LCharging,FL):-
 get_time(Ti),
 findall(City,delivery(_,_,_,City,_,_),LC),
 factory(SP),
 distance_queue(LC,LC,NL,_,_),
 reverse(NL,NL1),
 FL = NL1,
 sum_weights(NL1,LW,_),
 characteristicsTruck(eTruck01,Tare,_,Energy,_,_,_),
 add_TruckWeight(Tare,LW,LWT),
 append([SP|NL1],[SP],LComplete),
 cost_2(LComplete, LWT, Energy, Time, LCharging),!, get_time(Tf),
 T is Tf-Ti, write("Time to generate solution is "), write(T), write("sec").

distance_queue(LC,[_],[C], NLC, V):- factory(SP), find_the_closet(SP,LC,_,C1), C is C1, list_delete(C,LC,LC1), NLC = LC1, V is C, !.
distance_queue(LC,[_|LC1],[C2|LC2], NLC, V):-distance_queue(LC,LC1,LC2,NLC1,V1), find_the_closet(V1,NLC1,_,NC), C2 is NC, list_delete(NC,NLC1,LC3),
NLC = LC3, V is NC.

list_delete(_,[],[]):-!.
list_delete(Elem,[Elem|T],T):-!.
list_delete(Elem,[H|T],[H|U]):-list_delete(Elem,T,U).


find_the_closet(C1,[C],V,C):- dist(C1,Va,C), V is Va,!.
find_the_closet(C1,[CC|LC],V,C):- 
 dist(C1,Val,CC), find_the_closet(C1,LC,V1,C2), ((Val<V1, C is CC, V is Val); (C is C2, V is V1)),!.
 
 /* Weight Heuristic*/
 
weight_heuristic(Time,LCharging,FL):-
 get_time(Ti),
 findall(City,delivery(_,_,_,City,_,_),LC),
 factory(SP),
 weight_queue(LC,LC,NL,_),
 sum_weights(NL,LW,_),
 FL = NL,
 characteristicsTruck(eTruck01,Tare,_,Energy,_,_,_),
 add_TruckWeight(Tare,LW,LWT),
 append([SP|NL],[SP],LComplete),
 cost_2(LComplete, LWT, Energy, Time, LCharging),!, get_time(Tf),
 T is Tf-Ti, write("Time to generate solution is "), write(T), write("sec"). 

 
weight_queue([_],LC,[C1],NLC):- find_the_lightest(LC,C2,_),C1 is C2, list_delete(C1,LC,NLC1), NLC = NLC1, !.
weight_queue([_|LC],LC1,[C|FL],NLC):-
 weight_queue(LC,LC1,FL,NLC1), find_the_lightest(NLC1,C1,_), C is C1,list_delete(C,NLC1,NLC2), NLC = NLC2,!.
 
find_the_lightest([],_,1000000):-!.
find_the_lightest([H|LC],C,V):- find_the_lightest(LC,C1,V1), delivery(_,_,W,H,_,_),((W<V1, C is H, V is W);(C is C1, V is V1)), !.

/* Combine Heuristic*/

combine_heuristic(LC,Time,LCharging,FL):-
 get_time(Ti),
 factory(SP),
 combine_queue(LC,LC,NL,_,_),
 reverse(NL,NL1),
 sum_weights(NL1,LW,_),
 FL = NL1,
 characteristicsTruck(eTruck01,Tare,_,Energy,_,_,_),
 add_TruckWeight(Tare,LW,LWT),
 append([SP|NL1],[SP],LComplete),
 cost_2(LComplete, LWT, Energy, Time, LCharging),!, get_time(Tf),
 T is Tf-Ti.

combine_queue(LC,[_],[C], NLC, V):- factory(SP), find_the_lowest(SP,LC,_,C1), C is C1, list_delete(C,LC,LC1), NLC = LC1, V is C, !.
combine_queue(LC,[_|LC1],[C2|LC2], NLC, V):-combine_queue(LC,LC1,LC2,NLC1,V1), find_the_lowest(V1,NLC1,_,NC),
C2 is NC, list_delete(NC,NLC1,LC3), NLC = LC3, V is NC.

find_the_lowest(C1,[C],V,C):- calculate_combine_cost(C1,C,Val), V is Val,!.
find_the_lowest(C1,[CC|LC],V,C):-
 calculate_combine_cost(C1,CC,Val), find_the_lowest(C1,LC,V1,C2), ((Val<V1, C is CC, V is Val); (C is C2, V is V1)),!.
 
calculate_combine_cost(C1,C2,V):- dist(C1,D,C2), delivery(_,_,W,C2,_,_), V is D/W,!. 	


 
 /* SPRINT C */


% task(Id,Length,Deadline,Penalty).
task(t1,2,5,1).
task(t2,4,7,6).
task(t7,1,11,2).
task(t8,3,9,3).
task(t9,3,8,2).

% tasks(NTasks).
tasks(5).

/* parameters init */

init:-write('Number of New Generations: '),read(NG), 			(retract(generation(_));true), assertz(generation(NG)),
	write('Population Size: '),read(DP),
	(retract(population(_));true), assertz(population(DP)),
	write('Crossover Probability (%):'), read(P1),
	PC is P1/100, 
	(retract(prob_cross(_));true), 	assertz(prob_cross(PC)),
	write('Mutation Probability (%):'), read(P2),
	PM is P2/100, 
	(retract(prob_mut(_));true), assertz(prob_mut(PM)).


generate:-
	init,
	findall(City,delivery(_,_,_,City,_,_),LC),
	generate_population(LC,Pop),
	evaluate_population(Pop,PopEv),
	order_population(PopEv,PopOrd),
	generation(NG),
	generate_generation(LC,0,NG,PopOrd,_).

generate_population(LC,Pop):-
	population(CurPop),
 	length(LC,Len),
	generate_population(CurPop,LC,Len,Pop).

generate_population(0,_,_,[]):-!.

generate_population(CurPop,LC,Len,[Ind|Rest]):- combine_heuristic(LC,_,_,Ind), CurPop1 is CurPop - 1, population(Pop), CurPop is Pop, generate_population(CurPop1,LC,Len,Rest).

generate_population(CurPop,LC,Len,[Ind|Rest]):-
	CurPop1 is CurPop-1,
	generate_population(CurPop1,LC,Len,Rest),
	generate_individual(LC,Len,Ind),
	not(member(Ind,Rest)).
generate_population(CurPop,LC,Len,L):-
	generate_population(CurPop,LC,Len,L).

generate_individual([G],1,[G]):-!.

generate_individual(LC,Len,[G|Rest]):-
	Lenemp is Len + 1, % To use with random
	random(1,Lenemp,N),
	remove(N,LC,G,NewL),
	Len1 is Len-1,
	generate_individual(NewL,Len1,Rest).


remove(1,[G|Rest],G,Rest).
remove(N,[G1|Rest],G,[G1|Rest1]):-
	N1 is N-1,
	remove(N1,Rest,G,Rest1).

evaluate_population([],[]).
evaluate_population([Ind|Rest],[Ind*V|Rest1]):-
	calculate_cost_2(Ind,V,_),
	evaluate_population(Rest,Rest1).


order_population(PopEv,PopEvOrd):-
	bsort(PopEv,PopEvOrd).

bsort([X],[X]):-!.
bsort([X|Xs],Ys):-
	bsort(Xs,Zs),
	bexchange([X|Zs],Ys).


bexchange([X],[X]):-!.

bexchange([X*VX,Y*VY|L1],[Y*VY|L2]):-
	VX>VY,!,
	bexchange([X*VX|L1],L2).

bexchange([X|L1],[X|L2]):-bexchange(L1,L2).


generate_generation(_,G,G,Pop,FPop):-!, FPop = Pop.

generate_generation(_,-1,G,Pop,FPop):-!, FPop = Pop.


generate_generation(LC,N,G,Pop,FPop):-
	combine_heuristic(LC,T,_,_),
	give_head(Pop,H),
	del_ev(H,NH),
	calculate_cost_2(NH,V,_),
	((V+100<T, N1 is -1, NPopOrd = Pop, G1 is N, !);
	(mix_list(Pop,MPop), cross(LC,MPop,NPop1),
	mutation(LC,NPop1,NPop),
	evaluate_population(NPop,NPopEv),
	population(Num), Num1 is Num + 1,
	order_population(NPopEv,NPopEvOr),
	random(1,Num1,Id),
	remove(Id,NPopEvOr,_,NPopEv1),
	not(member(H,NPopEv)),
	NPopEv2 = [H|NPopEv1],
	order_population(NPopEv2,NPopOrd),
	N1 is N+1,
	G1 is G)),
	FPop = Pop,
	generate_generation(LC,N1,G1,NPopOrd,_).

generate_generation(LC,N,G,Pop,FPop) :- generate_generation(LC,N,G,Pop,FPop).

give_head([H|_],H):-!.

del_ev(Ind*_,Ind):-!.

generate_points_cross(LC,P1,P2):-
	generate_points_cross1(LC,P1,P2).

generate_points_cross1(LC,P1,P2):-
 	length(LC,N),
	NTemp is N+1,
	N>0,
	random(1,NTemp,P11),
	random(1,NTemp,P21),
	P11\==P21,!,
	((P11<P21,!,P1=P11,P2=P21);(P1=P21,P2=P11)).
generate_points_cross1(_,P1,P2):-
	generate_points_cross1(_,P1,P2).


cross(_,[],[]).
cross(_,[Ind*_],[Ind]).
cross(LC,[Ind1*_,Ind2*_|Rest],[NInd1,NInd2|Rest1]):-
	generate_points_cross(LC,P1,P2),
	prob_cross(Pcrs),random(0.0,1.0,Pc),
	((Pc =< Pcrs,!,
        crs(LC,Ind1,Ind2,P1,P2,NInd1),
	  crs(LC,Ind2,Ind1,P1,P2,NInd2))
	;
	(NInd1=Ind1,NInd2=Ind2)),
	cross(LC,Rest,Rest1).

preencheh([],[]).

preencheh([_|R1],[h|R2]):-
	preencheh(R1,R2).

mix_list([E],[E]):-!.

mix_list(L,NL):- length(L,V), V1 is V+1, random(1,V1,N), remove(N,L,E,L1), mix_list(L1,NL1),
 NL = [E|NL1],!.

sublist(L1,I1,I2,L):-
	I1 < I2,!,
	sublist1(L1,I1,I2,L).

sublist(L1,I1,I2,L):-
	sublist1(L1,I2,I1,L).

sublist1([X|R1],1,1,[X|H]):-!,
	preencheh(R1,H).

sublist1([X|R1],1,N2,[X|R2]):-!,
	N3 is N2 - 1,
	sublist1(R1,1,N3,R2).

sublist1([_|R1],N1,N2,[h|R2]):-
	N3 is N1 - 1,
	N4 is N2 - 1,
	sublist1(R1,N3,N4,R2).

rotate_right(L,K,L1):-
	findall(City,delivery(_,_,_,City,_,_),LC),
 	length(LC,N),
	T is N - K,
	rr(T,L,L1).

rr(0,L,L):-!.

rr(N,[X|R],R2):-
	N1 is N - 1,
	append(R,[X],R1),
	rr(N1,R1,R2).


eliminate([],_,[]):-!.

eliminate([X|R1],L,[X|R2]):-
	not(member(X,L)),!,
	eliminate(R1,L,R2).

eliminate([_|R1],L,R2):-
	eliminate(R1,L,R2).

insert(_,[],L,_,L):-!.
insert(LC,[X|R],L,N,L2):-
 	length(LC,T),
	((N>T,!,N1 is N mod T);N1 = N),
	insert1(X,N1,L,L1),
	N2 is N + 1,
	insert(LC,R,L1,N2,L2).


insert1(X,1,L,[X|L]):-!.
insert1(X,N,[Y|L],[Y|L1]):-
	N1 is N-1,
	insert1(X,N1,L,L1).

crs(LC,Ind1,Ind2,P1,P2,NInd11):-
	sublist(Ind1,P1,P2,Sub1),
 	length(LC,Len),
	R is Len-P2,
	rotate_right(Ind2,R,Ind21),
	eliminate(Ind21,Sub1,Sub2),
	P3 is P2 + 1,
	insert(LC,Sub2,Sub1,P3,NInd1),
	eliminate1(NInd1,NInd11).


eliminate1([],[]).

eliminate1([h|R1],R2):-!,
	eliminate1(R1,R2).

eliminate1([X|R1],[X|R2]):-
	eliminate1(R1,R2).

mutation(_,[],[]).
mutation(LC,[Ind|Rest],[NInd|Rest1]):-
	prob_mut(Pmut),
	random(0.0,1.0,Pm),
	((Pm < Pmut,!,mutation1(LC,Ind,NInd));NInd = Ind),
	mutation(LC,Rest,Rest1).

mutation1(LC,Ind,NInd):-
	generate_points_cross(LC,P1,P2),
	mutation22(Ind,P1,P2,NInd).

mutation22([G1|Ind],1,P2,[G2|NInd]):-
	!, P21 is P2-1,
	mutation23(G1,P21,Ind,G2,NInd).
mutation22([G|Ind],P1,P2,[G|NInd]):-
	P11 is P1-1, P21 is P2-1,
	mutation22(Ind,P11,P21,NInd).

mutation23(G1,1,[G2|Ind],G2,[G1|Ind]):-!.
mutation23(G1,P,[G|Ind],G2,[G|NInd]):-
	P1 is P-1,
	mutation23(G1,P1,Ind,G2,NInd).

num_of_trucks(LC,N):- sum_weights(LC,_,W), W1 is W*11/10, findall(C,characteristicsTruck(_,_,C,_,_,_,1),LW), count_trucks(W1,LW,V), N is V.

count_trucks(C_W,_,0):- C_W<0,!.

count_trucks(W,[H|T],V):- NW is W-H, count_trucks(NW,T,V1), V is V1+1.

part_deliveries_for_trucks(_,0,_,[]):-!.

part_deliveries_for_trucks(LC,N,[H|T],NL):- 
one_truck(LC,N,0,L,NLC),N1 is N-1,
sum_weights(L,_,W),((W>H,NN is N+1, part_deliveries_for_trucks(LC,NN,[H|T],NL));
(part_deliveries_for_trucks(NLC,N1,T,NL1),
NL = [L|NL1])),!.


one_truck(LC,N,I,NL,NLC):- ((In is I*N+1, 0 is  (I mod 2));(In is I*N+N)),
length(LC,V),In=<V,one_truck(LC,N,I+1,NL1,NLC1), 
remove(In,LC,Elem,_), NL = [Elem|NL1], remove(In,NLC1,_,NLC),!.

one_truck(LC,_,_,[],LC):-!.

sort_by_weight([A],[A]):-!.

sort_by_weight(L,SL):- find_the_lightest(L,C,_), list_delete(C,L,NL),
sort_by_weight(NL,SL1), SL = [C|SL1],!.

generate_for_serveral_trucks(FL):- 
findall(City,delivery(_,_,_,City,_,_),LC),
sort_by_weight(LC,SL), reverse(SL,RSL),
num_of_trucks(RSL,N),findall(C,characteristicsTruck(_,_,C,_,_,_,1),LW),
part_deliveries_for_trucks(RSL,N,LW,PL), generate_for_truck(PL,FL).

generate_for_truck([],[]):-!.

generate_for_truck([H|T],NL):- generate_for_truck(T,NL1),
 generate_population(H,Pop),
 evaluate_population(Pop,PopEv),
 order_population(PopEv,PopOrd),
 generation(NG),
 generate_generation(H,0,NG,PopOrd,FP),
 NL = [FP|NL1],!.

give_best_paths(FL):- generate_for_serveral_trucks(L), create_list(L,FL1), reverse(FL1,FL),!.

create_list([],[]):-!.

create_list([H|T],[FH|T1]):- give_head(H,H1), create_list(T,T1), del_ev(H1,FH),!.

