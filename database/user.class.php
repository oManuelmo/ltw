<?php
  declare(strict_types = 1);

  class User {
    public int $id;
    public string $firstName;
    public string $lastName;
    public string $address;
    public string $city;
    public string $country;
    public string $postalcode;
    public string $phone;
    public string $email;

    public function __construct(int $id, string $firstName, string $lastName, string $address, string $city, string $country, string $postalcode, string $phone, string $email)
    {
      $this->id = $id;
      $this->firstName = $firstName;
      $this->lastName = $lastName;
      $this->address = $address;
      $this->city = $city;
      $this->country = $country;
      $this->postalcode = $postalcode;
      $this->phone = $phone;
      $this->email = $email;
    }

    function name() {
      return $this->firstName . ' ' . $this->lastName;
    }

    function save($db) {
      $stmt = $db->prepare('
        UPDATE User SET FirstName = ?, LastName = ?
        WHERE UserId = ?
      ');

      $stmt->execute(array($this->firstName, $this->lastName, $this->id));
    }
    
    static function getUserWithPassword(PDO $db, string $email, string $password) : ?User {
      $stmt = $db->prepare('
        SELECT UserId, FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Email
        FROM User 
        WHERE lower(email) = ? AND password = ?
      ');

      $stmt->execute(array(strtolower($email), sha1($password)));
  
      if ($user = $stmt->fetch()) {
        return new User(
          $user['UserId'],
          $user['FirstName'],
          $user['LastName'],
          $user['Address'],
          $user['City'],
          $user['Country'],
          $user['PostalCode'],
          $user['Phone'],
          $user['Email']
        );
      } else return null;
    }

    static function getUser(PDO $db, int $id) : User {
      $stmt = $db->prepare('
        SELECT UserId, FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Email
        FROM User 
        WHERE UserId = ?
      ');

      $stmt->execute(array($id));
      $user = $stmt->fetch();
      
      return new User(
        $user['UserId'],
        $user['FirstName'],
        $user['LastName'],
        $user['Address'],
        $user['City'],
        $user['Country'],
        $user['PostalCode'],
        $user['Phone'],
        $user['Email']
      );
    }

  }
?>