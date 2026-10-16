`timescale 1ns/1ps

module tb_hash_constants;

    // Inputs
    reg [1:0] mode;

    // Outputs
    wire [31:0] H0, H1, H2, H3, H4, H5, H6, H7;

    // Instantiate the Unit Under Test (UUT)
    hash_constants uut (
        .mode(mode),
        .H0(H0), .H1(H1), .H2(H2), .H3(H3), .H4(H4), .H5(H5), .H6(H6), .H7(H7)
    );

    initial begin
        // Test case for SHA-256 mode (mode = 0)
        mode = 2'b00; // Set mode to 0
        #10; // Wait for some time to allow outputs to stabilize

        // Check expected values for SHA-256
        if (H0 !== 32'h6a09e667) begin
            $display("FAIL: H0 expected 0x6a09e667, got 0x%h", H0);
            $finish;
        end
        if (H1 !== 32'hbb67ae85) begin
            $display("FAIL: H1 expected 0xbb67ae85, got 0x%h", H1);
            $finish;
        end
        if (H2 !== 32'h3c6ef372) begin
            $display("FAIL: H2 expected 0x3c6ef372, got 0x%h", H2);
            $finish;
        end
        if (H3 !== 32'ha54ff53a) begin
            $display("FAIL: H3 expected 0xa54ff53a, got 0x%h", H3);
            $finish;
        end
        if (H4 !== 32'h510e527f) begin
            $display("FAIL: H4 expected 0x510e527f, got 0x%h", H4);
            $finish;
        end
        if (H5 !== 32'h9b05688c) begin
            $display("FAIL: H5 expected 0x9b05688c, got 0x%h", H5);
            $finish;
        end
        if (H6 !== 32'h1f83d9ab) begin
            $display("FAIL: H6 expected 0x1f83d9ab, got 0x%h", H6);
            $finish;
        end
        if (H7 !== 32'h5be0cd19) begin
            $display("FAIL: H7 expected 0x5be0cd19, got 0x%h", H7);
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule