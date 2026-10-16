`timescale 1ns/1ps

module tb_hash_constants;

    // Inputs
    reg [1:0] mode;

    // Outputs
    wire [31:0] H0, H1, H2, H3, H4, H5, H6, H7;

    // Instantiate the Unit Under Test (UUT)
    hash_constants uut (
        .mode(mode),
        .H0(H0),
        .H1(H1),
        .H2(H2),
        .H3(H3),
        .H4(H4),
        .H5(H5),
        .H6(H6),
        .H7(H7)
    );

    initial begin
        // Test SHA-256 constants
        mode = 2'b00; // Select SHA-256
        #10; // Wait for the output to stabilize

        // Check the expected values
        if (H0 !== 32'h6a09e667) begin
            $display("FAIL: H0 is incorrect");
            $finish;
        end
        if (H1 !== 32'hbb67ae85) begin
            $display("FAIL: H1 is incorrect");
            $finish;
        end
        if (H2 !== 32'h3c6ef372) begin
            $display("FAIL: H2 is incorrect");
            $finish;
        end
        if (H3 !== 32'ha54ff53a) begin
            $display("FAIL: H3 is incorrect");
            $finish;
        end
        if (H4 !== 32'h510e527f) begin
            $display("FAIL: H4 is incorrect");
            $finish;
        end
        if (H5 !== 32'h9b05688c) begin
            $display("FAIL: H5 is incorrect");
            $finish;
        end
        if (H6 !== 32'h1f83d9ab) begin
            $display("FAIL: H6 is incorrect");
            $finish;
        end
        if (H7 !== 32'h5be0cd19) begin
            $display("FAIL: H7 is incorrect");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule