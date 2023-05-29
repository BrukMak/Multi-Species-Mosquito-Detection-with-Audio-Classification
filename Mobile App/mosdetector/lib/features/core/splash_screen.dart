import 'package:flutter/material.dart';
import 'package:mosdetector/core/shared_widgets/primary_button.dart';
import 'package:mosdetector/core/utils/ui_converter.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/images.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 9, right: 9, top: 117, bottom: 58),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text("Mos Detector", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Updock"),),
            SizedBox(height: UIConverter.getComponentHeight(context, 51),),
            Image(image: const NetworkImage("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAIcAhwMBIgACEQEDEQH/xAAaAAACAwEBAAAAAAAAAAAAAAAAAwIEBQEG/8QAMxAAAQQBAgQEAwgCAwAAAAAAAQACAxEEEiEiMUFRBSNhcVKBghMyYpGhwdHhJEIUNHL/xAAZAQADAQEBAAAAAAAAAAAAAAAAAgMEAQX/xAAfEQADAAIDAAMBAAAAAAAAAAAAAQIDERIhMQQTQSL/2gAMAwEAAhEDEQA/AL1KtmjyfqCuUq+cPJ+oL3JfZ4eTejNpRITEBpPJUZOOvSAaFsMaNDfYLNazutlrLjb7BJSHjKkxFIDbTHN0izsB1VaTJDdmbnv0U9GnkmtocW7clAt3VX7Rwdq1G05mS12z+E9+iZroMddjQNl2lNrbAI5KYYF1I7VpCaRSaWKDqYLcaHqjQK0yOlbHhrf8VvuV5+XKJ2jFequeGzyxQgteTZNgm7ReGnIi+TM0b1IScfMjl2fUbvU7fmhZXLT00a5yRS2mZACRnDyPqCtALpaCKIsHoryYMmn0YZU2DZXZ8EHih2/CUqDFmfbdBFcyeQVU+yFLUiKWqZmsY0DiNDZTx8KOLd3G7uRsFXe0Fx903pDnxEzyOkabPyVcNVp8bi2gLJ7J0GAb1TWPwhJTSNnx06nooEdFAjot/wCxjMegsGjtSoZGA4WYbcPhPNcVpmlQ0V4ZXRgUdux5K7FMyTrpPYqjpIFEUfVdP3T7KySZlvf4Pny2s2jpzh16KhI98h1PJJXTuhsbnmmNLj6J+KRNNv0gPVX4JGQ441nffYc0Q4YbxS7nt0SszaYgAAUKpdTT6J2mvCM2S+TYcI9Oa4loXehT22T4fFPbgND+4/cLMkwZ45AzQXXyLdwVpZGexliGnu79P7WdJLJI/W95LhyPZeZj5fp6PyHG+i3jeFtHFkG/wjl81fdBG+MMcxtDlW1KhjeIObTZxqHxDn81of8AJh0ag8O9GpK57LY3i4GfkeHvZvCS9vbqFkx4r5HEu4RfUc1uS5D5NrpvYLKEjmOIHK+S043WjBmjFyTS6JthZG06Rv36ldDQpNka9vY+qOSSt77NmHjx/kNIUS2lNcSsqmV5ceOUcY3+Ic1QyMOSMHSNY7t5/ktuOFz99gO5VhsTWNOkb1zTTkci3jVHl4sQuov4R26lW2RtYKaAFqS4zJLI4Xd1SlhdEeIfPomeR0cnHMi1m57g2c+wWiVlZ4/yT7BaMWzLmiGJJJ9EICEPlsZcUj09LjnBgt3JN0pOYPJ+pZV6cukkVZslx4YxpHfqlQvfGdTXEO73zXSxDGlV0TVJmhj5zHU2UaT8Q5KtNK1riBubSw2lekgjlaNTd+4R4c1yM0uc51uP5KzBkObs8am/qoS4r4jf3m9woikPTL4+l0azA18dtN+nZLcKKXgvOh/yTiN1J9M0LtE43OaBRViIiQEVRrkjHxHytBPC3uea0caFkT2hg3J3PVTqkh1LMoto0quePLb7r0uTgxz7gaH/ABDr7hYXi+LLjsbrbw6tnDkjFkTYXLSMkilk5/8A2uXMBbDglPgZI3S9oIW+Hx9MN9+GMAuK9Ngvabi4h26hCfkhdM9BVJOYPJH/AKVrSk5o8j6lhn0LXRmrm4TKXKVWyeNHAdt1pg8I9lm1stRo4R7JWy0ytin7tKQ6APO2xVwssEDmpxwaTb9/RTdaNMraFeH473awG7WN+i0G4zGEE8R7lWfDwNLx6hNfCDuNvRQu22aMcJIQy2m2mlbge3Wy+6RppMiAL2+6Rjl6Vwo6VWe3V94Ag8wVZcFAsU10OYeZ4Ox9vxqY74DyP8KlB4VkyyFr2fZtB3c79u69RoRoWic9JaI1ghvZn4vh8GL9xlv6vdz/AKXVf0IU3bfpRQl4eeASc0eRy6q1pIJBFEdF2lZVpnn1CpGGfRRpas+EyTdlNd+hSo/DJ3EF7Cxh5PPI+3dV+xCrG14iiBe1WVqAU0CtwFax8SLHHC23fEeaa+MPHEPmkrJstOPXpRjHGFYLVKPEkdKBG3X7dFow4LRxS8R7Dkp1aKzLZDBiqN570rNJosChyXNKg62XS0VnN4iuxt8xtDqrLcZzzZ2H6qyyJrBsK/dDtHeJAsUdKfpRpU9j6EaFzQn6UaV3kGhOhCdpQubO6OZOFDkjjbxdHDmFky+E5DZNLAHtP+11XuvQ0ikTbnwSsU16ZmL4VFDTpakf68h8lefGHtLXgEHmCm0ilx02MpSWkZOT4Z/tAfpP8qON4Y51On4R8IO62KRS79laOfXO9iI4WRN0xtAHoh8LXeh7p9IpLtjaKX2D7qtu6cyFrenzT6RSNgloXpRpTKRSAF6UaUykUgBelFJlI0oOi6XE3ShAE6RSlSKS7AjSKUqRSNgRpFKVIpGwI0ilKkUjYEaRSlSKRsCNIpSpFI2BGkUpUikbAjSKUqRSNgRpClSEbAkhCFwAQhCABCEIAEIQgAQhCABCEIAEIQgAQhCABCEIA//Z"), height: UIConverter.getComponentHeight(context, 418), width: UIConverter.getComponentWidth(context, 415 ),), 
            SizedBox(height: UIConverter.getComponentHeight(context, 120),),
            PrimaryButton(text: "Get Started", backgroundColor: buttonColor, onPressed: (){}, height: UIConverter.getComponentHeight(context, 70), width: UIConverter.getComponentWidth(context, 348), fontFamily: "Urbanist", fontSize: 18, fontWeight: FontWeight.w500, textColor: mainTextColor, borderRadius: 12)

          ],
        ),
      ),);
  }
}

