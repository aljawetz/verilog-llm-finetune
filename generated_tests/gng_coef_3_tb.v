`timescale 1ns/1ps

module tb_gng_coef;

    // Parameters
    reg clk;
    reg [7:0] addr;
    wire [17:0] c0;
    wire [17:0] c1;
    wire [16:0] c2;

    // Instantiate the Unit Under Test (UUT)
    gng_coef uut (
        .clk(clk),
        .addr(addr),
        .c0(c0),
        .c1(c1),
        .c2(c2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        addr = 8'd0;

        // Wait for the first clock edge
        #10;

        // Test all addresses from 0 to 10
        for (addr = 0; addr <= 10; addr = addr + 1) begin
            #10; // Wait for a clock cycle
            
            // Check expected outputs
            case (addr)
                8'd0: if (c0 !== 18'b00001010110010100100 || c1 !== 18'b100110111110001110 || c2 !== 17'b10100011110000000) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd1: if (c0 !== 18'b00000111110100011100 || c1 !== 18'b101001011111011001 || c2 !== 17'b01011111011110011) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd2: if (c0 !== 18'b00000101000110010000 || c1 !== 18'b101010111101101110 || c2 !== 17'b00110010101000000) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd3: if (c0 !== 18'b00000010100001000100 || c1 !== 18'b101011101111111001 || c2 !== 17'b00001111111010011) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd4: if (c0 !== 18'b00010010011001111000 || c1 !== 18'b101100101100100010 || c2 !== 17'b10101101110011100) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd5: if (c0 !== 18'b00010000001010001100 || c1 !== 18'b101111010111110111 || c2 !== 17'b01110101000001100) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd6: if (c0 !== 18'b00001110001100011100 || c1 !== 18'b110001001011101011 || c2 !== 17'b01010011011010011) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd7: if (c0 !== 18'b00001100011011000100 || c1 !== 18'b110010011110011100 || c2 !== 17'b00111101101011001) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd8: if (c0 !== 18'b00011000100010111000 || c1 !== 18'b101111110110101010 || c2 !== 17'b10100011001000110) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd9: if (c0 !== 18'b00010110101011110100 || c1 !== 18'b110010010111100001 || c2 !== 17'b01101111010111011) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                8'd10: if (c0 !== 18'b00010101000101101000 || c1 !== 18'b110100000101110001 || c2 !== 17'b01010000111111000) 
                        $display("FAIL: Address %d outputs incorrect values", addr);
                default: ;
            endcase
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule