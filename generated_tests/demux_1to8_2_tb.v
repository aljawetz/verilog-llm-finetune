`timescale 1ns/1ps

module tb_demux_1to8;

    reg i;
    reg [2:0] s;
    wire [7:0] y;
    
    // Instantiate the module under test (uut)
    demux_1to8 uut (
        .y(y),
        .s(s),
        .i(i)
    );

    initial begin
        // Initialize inputs
        i = 0;
        s = 3'b000;
        
        // Test case 1: Select output 0
        i = 1; s = 3'b000; #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);
            $finish;
        end
        
        // Test case 2: Select output 1
        i = 1; s = 3'b001; #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);
            $finish;
        end
        
        // Test case 3: Select output 2
        i = 1; s = 3'b010; #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);
            $finish;
        end
        
        // Test case 4: Select output 3
        i = 1; s = 3'b011; #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);
            $finish;
        end
        
        // Test case 5: Select output 4
        i = 1; s = 3'b100; #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);
            $finish;
        end
        
        // Test case 6: Select output 5
        i = 1; s = 3'b101; #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);
            $finish;
        end
        
        // Test case 7: Select output 6
        i = 1; s = 3'b110; #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);
            $finish;
        end
        
        // Test case 8: Select output 7
        i = 1; s = 3'b111; #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);
            $finish;
        end
        
        // Test case 9: Check all outputs are zero when i is 0
        i = 0; s = 3'b000; #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 9 failed, expected 00000000, got %b", y);
            $finish;
        end
        
        // Test case 10: Check all outputs are zero when i is 0 and different select
        i = 0; s = 3'b111; #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 10 failed, expected 00000000, got %b", y);
            $finish;
        end
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule