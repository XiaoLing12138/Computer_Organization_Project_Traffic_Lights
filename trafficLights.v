`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/19 11:35:45
// Design Name: 
// Module Name: trafficLights
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module trafficLights( 
    input start,
    input clk,
    output reg [7:0] light,
    output reg [7:0] lightControl
);
reg [7:0] left;
reg [7:0] right1;
reg [7:0] right2;
reg[13:0] oneSecond;
reg[13:0] twoSecond;
reg[3:0] timeCount;
reg[1:0] lightType;
reg[1:0] lightRoot;
reg[4:0] slowSecond;
//right1 for first, right2 for Second
always @(posedge clk) begin
    if(start == 0) begin
        timeCount<=4'd15;
        lightType<=2'd0;
        oneSecond<=14'd0;
        twoSecond<=14'd0;
        right1 <= 4'd15;
        right2 <= 4'd15;
        left <= 8'b00001101;
        lightControl <= 8'b11111111;
        lightRoot<= 2'd0;
        slowSecond<= 5'd0;
    end
    else begin
            oneSecond <= oneSecond+14'd1;
    if(oneSecond== 14'd10000) begin
        oneSecond <= 14'd0;
        twoSecond <= twoSecond+14'd1;
        slowSecond <=slowSecond+5'd1;
    end
    if(twoSecond == 14'd10000) begin
        twoSecond <= 14'd0;
        if(lightType==2'd0) begin
            if(timeCount==4'd0) begin
            timeCount <= 4'd3;
            lightType <=lightType+2'd1;
            case(lightType)
                2'd0: left <= 8'b00001101;
                2'd1: left <= 8'b00001000;
                2'd2: left <= 8'b01000010;
                default: left <= 8'b00000000;
            endcase
            end
            else begin
                timeCount <=timeCount -4'd1;
            end
            case(timeCount)
                4'd1: right1 <= 8'b01111001;
                4'd2: right1 <= 8'b00100100;
                4'd3: right1 <= 8'b00110000;
                4'd4: right1 <= 8'b00011001;
                4'd5: right1 <= 8'b00010010;
                4'd6: right1 <= 8'b00000010;
                4'd7: right1 <= 8'b01111000;
                4'd8: right1 <= 8'b00000000;
                4'd9: right1 <= 8'b00010000;
                4'd10: right1 <= 8'b01000000;
                4'd11: right1 <= 8'b01111001;
                4'd12: right1 <= 8'b00100100;
                4'd13: right1 <= 8'b00110000;
                4'd14: right1 <= 8'b00011001;
                4'd15: right1 <= 8'b00010010;
                default: right1 <= 8'b01000000;
            endcase
            case(timeCount)
                4'd1: right2 <= 8'b01000000;
                4'd2: right2 <= 8'b01000000;
                4'd3: right2 <= 8'b01000000;
                4'd4: right2 <= 8'b01000000;
                4'd5: right2 <= 8'b01000000;
                4'd6: right2 <= 8'b01000000;
                4'd7: right2 <= 8'b01000000;
                4'd8: right2 <= 8'b01000000;
                4'd9: right2 <= 8'b01000000;    
                4'd10: right2 <= 8'b01111001;
                4'd11: right2 <= 8'b01111001;
                4'd12: right2 <= 8'b01111001;
                4'd13: right2 <= 8'b01111001;
                4'd14: right2 <= 8'b01111001;
                4'd15: right2 <= 8'b01111001;
                default: right2 <= 8'b01000000;
            endcase
        end
        else if(lightType==2'd1) begin
            if(timeCount==4'd0) begin
                timeCount <= 4'd15;
                lightType <=lightType+2'd1;
                case(lightType)
                    2'd0: left <= 8'b00001101;
                    2'd1: left <= 8'b00001000;
                    2'd2: left <= 8'b01000010;
                    default: left <= 8'b00000000;
                endcase
            end
            else begin
                timeCount <=timeCount -4'd1;
            end
            case(timeCount)
                4'd1: right1 <= 8'b01111001;
                4'd2: right1 <= 8'b00100100;
                4'd3: right1 <= 8'b00110000;
                default: right1 <= 8'b01000000;
            endcase
            case(timeCount)
                4'd1: right2 <= 8'b01000000;
                4'd2: right2 <= 8'b01000000;
                4'd3: right2 <= 8'b01000000;
                default: right2 <= 8'b01000000;
            endcase
        end
        else if(lightType==2'd2) begin
            if(timeCount==4'd0) begin
                timeCount <= 4'd15;
                lightType <=2'd0;
                case(lightType)
                    2'd0: left <= 8'b00001101;
                    2'd1: left <= 8'b00001000;
                    2'd2: left <= 8'b01000010;
                    default: left <= 8'b00000000;
                endcase
            end
            else begin
                timeCount <=timeCount -4'd1;
            end
            case(timeCount)
                4'd1: right1 <= 8'b01111001;
                4'd2: right1 <= 8'b00100100;
                4'd3: right1 <= 8'b00110000;
                4'd4: right1 <= 8'b00011001;
                4'd5: right1 <= 8'b00010010;
                4'd6: right1 <= 8'b00000010;
                4'd7: right1 <= 8'b01111000;
                4'd8: right1 <= 8'b00000000;
                4'd9: right1 <= 8'b00010000;
                4'd10: right1 <= 8'b01000000;
                4'd11: right1 <= 8'b01111001;
                4'd12: right1 <= 8'b00100100;
                4'd13: right1 <= 8'b00110000;
                4'd14: right1 <= 8'b00011001;
                4'd15: right1 <= 8'b00010010;
                default: right1 <= 8'b01000000;
            endcase
            case(timeCount)
                4'd1: right2 <= 8'b01000000;
                4'd2: right2 <= 8'b01000000;
                4'd3: right2 <= 8'b01000000;
                4'd4: right2 <= 8'b01000000;
                4'd5: right2 <= 8'b01000000;
                4'd6: right2 <= 8'b01000000;
                4'd7: right2 <= 8'b01000000;
                4'd8: right2 <= 8'b01000000;
                4'd9: right2 <= 8'b01000000;    
                4'd10: right2 <= 8'b01111001;
                4'd11: right2 <= 8'b01111001;
                4'd12: right2 <= 8'b01111001;
                4'd13: right2 <= 8'b01111001;
                4'd14: right2 <= 8'b01111001;
                4'd15: right2 <= 8'b01111001;
                default: right2 <= 8'b01000000;
            endcase
        end
    end
    if(slowSecond==5'd20) begin
        slowSecond<=5'd0;
        if(lightRoot==2'd0) begin
            light <= left;
            lightControl <=8'b11110111;
            lightRoot<=lightRoot+2'd1;
        end
        else if(lightRoot==2'd1) begin
            light <= right2;
            lightControl <=8'b11111101;
            lightRoot<=lightRoot+2'd1;
        end
        else if(lightRoot==2'd2) begin
            light <= right1;
            lightControl <=8'b11111110;
            lightRoot<=2'd0;
        end
    end
    end
end

endmodule
